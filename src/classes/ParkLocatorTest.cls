@Istest
public class ParkLocatorTest {
    @Istest
    static void testCallout(){
        Test.setMock(WebserviceMock.class, new ParkServiceMock());
        String country = 'USA';
        system.assertEquals(new List<String>{'Me', 'You', 'Him'},
                            ParkLocator.country(country));
                           
    }

}