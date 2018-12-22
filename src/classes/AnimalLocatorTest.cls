/**
 * Created by Owner on 11/24/2018.
 */

@istest
public with sharing class AnimalLocatorTest {
    @istest
    static void AnimalLocatorMock1(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String result = AnimalLocator.getAnimalNameById(3);
        String expectedResult = 'cow';
        System.assertEquals(result, expectedResult);
    }


}