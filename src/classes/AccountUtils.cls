/**
 * Created by Brooks Johnson on 12/22/2018.
 */

public without sharing class AccountUtils {
    public static void sortOwners(List<Account> oldAccounts, List<Account> newAccounts){
        //map Accounts to their users
        Map<Id, List<Account>> userIdToAccounts = getUserToAccounts(newAccounts);

        //for each user, calculate account revenue and decide if performance tier should be updated
        Map<Id, Decimal> userIdToRevenue = getUserRevenue(userIdToAccounts);

        //calls future method to make revenue updates on the user
        if(userIdToAccounts.keySet().size() >0){
            UserUtils.updateAnnualRevenue(userIdToRevenue);
        }
     }
    public static Map<Id, List<Account>> getUserToAccounts(List<Account> accountsByUsers){

        Map<Id, List<Account>> userIdToAccounts = new Map<Id, List<Account>>();
        for (Account account : accountsByUsers){
            if (account.AnnualRevenue != null && account.AnnualRevenue != 0) {
                if (userIdToAccounts.containsKey(account.OwnerId)){
                    userIdToAccounts.get(account.OwnerId).add(account);
                }else {
                    userIdToAccounts.put(account.OwnerId, new List<Account>{account});
                    System.debug('userIdToAccounts.keyset.size(): ' + userIdToAccounts.keySet().size());
                }
            }
        }return userIdToAccounts;
    }
    public static Map<Id, Decimal> getUserRevenue(Map<Id, List<Account>> userIdToAccounts){
        Map<Id, Decimal> userIdToRevenue = new Map<Id, Decimal>();
        for (Id userId : userIdToAccounts.keySet()){
            //iterate through accounts to retrieve total
            Decimal totalRevenue = 0;
            for (Account account : userIdToAccounts.get(userId)){
                totalRevenue += account.AnnualRevenue;
            }userIdToRevenue.put(userId, totalRevenue);
        }
        return userIdToRevenue;
    }
}