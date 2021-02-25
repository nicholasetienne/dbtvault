@fixture.set_workdir
Feature: Multi Active Satellites Loaded in cycles using separate manual loads

  @fixture.multi_active_satellite_cycle
  Scenario: [SAT-CYCLE] MULTI_ACTIVE_SATELLITE load over several cycles
    Given the RAW_STAGE stage is empty
    And the MULTI_ACTIVE_SATELLITE ma_sat is empty

    # ================ DAY 1 ===================
    When the RAW_STAGE is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1001        | Albert        | 17-214-233-1211 | 2019-01-01     | 2019-01-01 | *      |
      | 1001        | Albert        | 17-214-233-1221 | 2019-01-01     | 2019-01-01 | *      |
      | 1001        | Albert        | 17-214-233-1231 | 2019-01-01     | 2019-01-01 | *      |
      | 1002        | Beth          | 17-214-233-1212 | 2019-01-01     | 2019-01-01 | *      |
      | 1002        | Beth          | 17-214-233-1222 | 2019-01-01     | 2019-01-01 | *      |
      | 1002        | Beth          | 17-214-233-1232 | 2019-01-01     | 2019-01-01 | *      |
      | 1003        | Charley       | 17-214-233-1213 | 2019-01-01     | 2019-01-01 | *      |
      | 1003        | Charley       | 17-214-233-1223 | 2019-01-01     | 2019-01-01 | *      |
      | 1003        | Charley       | 17-214-233-1233 | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1214 | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1224 | 2019-01-01     | 2019-01-01 | *      |
      | 1010        | Jenny         | 17-214-233-1234 | 2019-01-01     | 2019-01-01 | *      |
      | 1012        | Albert        | 17-214-233-1215 | 2019-01-01     | 2019-01-01 | *      |
      | 1012        | Albert        | 17-214-233-1225 | 2019-01-01     | 2019-01-01 | *      |
      | 1012        | Albert        | 17-214-233-1235 | 2019-01-01     | 2019-01-01 | *      |
    And I create the STG_CUSTOMER stage
    And I load the MULTI_ACTIVE_SATELLITE ma_sat

    # ================ DAY 2 ===================
    # Beah (new), Chris (new), David (new), Jenny (+)
    When the RAW_STAGE is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1002        | Beah          | 17-214-233-1212 | 2019-01-02     | 2019-01-02 | *      |
      | 1002        | Beah          | 17-214-233-1222 | 2019-01-02     | 2019-01-02 | *      |
      | 1003        | Chris         | 17-214-233-1223 | 2019-01-02     | 2019-01-02 | *      |
      | 1004        | David         | 17-214-233-1216 | 2019-01-02     | 2019-01-02 | *      |
      | 1004        | David         | 17-214-233-1226 | 2019-01-02     | 2019-01-02 | *      |
      | 1004        | David         | 17-214-233-1236 | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1212 | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1222 | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1232 | 2019-01-02     | 2019-01-02 | *      |
      | 1010        | Jenny         | 17-214-233-1242 | 2019-01-02     | 2019-01-02 | *      |
      | 1012        | Albert        | 17-214-233-1215 | 2019-01-02     | 2019-01-02 | *      |
      | 1012        | Albert        | 17-214-233-1225 | 2019-01-02     | 2019-01-02 | *      |
      | 1012        | Albert        | 17-214-233-1235 | 2019-01-02     | 2019-01-02 | *      |
    And I create the STG_CUSTOMER stage
    And I load the MULTI_ACTIVE_SATELLITE ma_sat

    # ================ DAY 3 ===================
    # Beth (hd), Claire (new, dupl), David (-), Freia (new)
    When the RAW_STAGE is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1002        | Beth          | 17-214-233-1312 | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1222 | 2019-01-03     | 2019-01-03 | *      |
      | 1002        | Beth          | 17-214-233-1232 | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Claire        | 17-214-233-1210 | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Claire        | 17-214-233-1210 | 2019-01-03     | 2019-01-03 | *      |
      | 1004        | David         | 17-214-233-1216 | 2019-01-03     | 2019-01-03 | *      |
      | 1004        | David         | 17-214-233-1226 | 2019-01-03     | 2019-01-03 | *      |
      | 1006        | Freia         | 17-214-233-1212 | 2019-01-03     | 2019-01-03 | *      |
      | 1003        | Chris         | 17-214-233-1223 | 2019-01-03     | 2019-01-03 | *      |
    And I create the STG_CUSTOMER stage
    And I load the MULTI_ACTIVE_SATELLITE ma_sat

    # ================ DAY 4 ===================
    # Beah (+), Charley (-), Geoff (new, dupl), Jenny (hd)
    When the RAW_STAGE is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | CUSTOMER_PHONE  | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1002        | Beah          | 17-214-233-1212 | 2019-01-04     | 2019-01-04 | *      |
      | 1002        | Beah          | 17-214-233-1222 | 2019-01-04     | 2019-01-04 | *      |
      | 1002        | Beah          | 17-214-233-1232 | 2019-01-04     | 2019-01-04 | *      |
      | 1003        | Charley       | 17-214-233-1223 | 2019-01-04     | 2019-01-04 | *      |
      | 1007        | Geoff         | 17-214-233-1219 | 2019-01-04     | 2019-01-04 | *      |
      | 1007        | Geoff         | 17-214-233-1219 | 2019-01-04     | 2019-01-04 | *      |
      | 1007        | Geoff         | 17-214-233-1219 | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenny         | 17-214-233-1312 | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenny         | 17-214-233-1322 | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenny         | 17-214-233-1332 | 2019-01-04     | 2019-01-04 | *      |
      | 1010        | Jenny         | 17-214-233-1342 | 2019-01-04     | 2019-01-04 | *      |
    And I create the STG_CUSTOMER stage
    And I load the MULTI_ACTIVE_SATELLITE ma_sat

    # =============== CHECKS ===================
    Then the MULTI_ACTIVE_SATELLITE table should contain expected data
      | CUSTOMER_PK | HASHDIFF                                  | CUSTOMER_PHONE  | CUSTOMER_NAME | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | md5('1001') | md5('1001\|\|ALBERT\|\|17-214-233-1211')  | 17-214-233-1211 | Albert        | 2019-01-01     | 2019-01-01 | *      |
      | md5('1001') | md5('1001\|\|ALBERT\|\|17-214-233-1221')  | 17-214-233-1221 | Albert        | 2019-01-01     | 2019-01-01 | *      |
      | md5('1001') | md5('1001\|\|ALBERT\|\|17-214-233-1231')  | 17-214-233-1231 | Albert        | 2019-01-01     | 2019-01-01 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1212')    | 17-214-233-1212 | Beth          | 2019-01-01     | 2019-01-01 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1222')    | 17-214-233-1222 | Beth          | 2019-01-01     | 2019-01-01 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1232')    | 17-214-233-1232 | Beth          | 2019-01-01     | 2019-01-01 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1213') | 17-214-233-1213 | Charley       | 2019-01-01     | 2019-01-01 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1223') | 17-214-233-1223 | Charley       | 2019-01-01     | 2019-01-01 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1233') | 17-214-233-1233 | Charley       | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1214')   | 17-214-233-1214 | Jenny         | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1223')   | 17-214-233-1223 | Jenny         | 2019-01-01     | 2019-01-01 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1234')   | 17-214-233-1234 | Jenny         | 2019-01-01     | 2019-01-01 | *      |
      | md5('1012') | md5('1012\|\|ALBERT\|\|17-214-233-1215')  | 17-214-233-1215 | Albert        | 2019-01-01     | 2019-01-01 | *      |
      | md5('1012') | md5('1012\|\|ALBERT\|\|17-214-233-1225')  | 17-214-233-1225 | Albert        | 2019-01-01     | 2019-01-01 | *      |
      | md5('1012') | md5('1012\|\|ALBERT\|\|17-214-233-1235')  | 17-214-233-1235 | Albert        | 2019-01-01     | 2019-01-01 | *      |
      | md5('1002') | md5('1002\|\|BEAH\|\|17-214-233-1212')    | 17-214-233-1212 | Beah          | 2019-01-02     | 2019-01-02 | *      |
      | md5('1002') | md5('1002\|\|BEAH\|\|17-214-233-1222')    | 17-214-233-1222 | Beah          | 2019-01-02     | 2019-01-02 | *      |
      | md5('1003') | md5('1003\|\|CHRIS\|\|17-214-233-1223')   | 17-214-233-1223 | Chris         | 2019-01-02     | 2019-01-02 | *      |
      | md5('1004') | md5('1004\|\|DAVID\|\|17-214-233-1216')   | 17-214-233-1216 | David         | 2019-01-02     | 2019-01-02 | *      |
      | md5('1004') | md5('1004\|\|DAVID\|\|17-214-233-1226')   | 17-214-233-1226 | David         | 2019-01-02     | 2019-01-02 | *      |
      | md5('1004') | md5('1004\|\|DAVID\|\|17-214-233-1236')   | 17-214-233-1236 | David         | 2019-01-02     | 2019-01-02 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1212')   | 17-214-233-1212 | Jenny         | 2019-01-02     | 2019-01-02 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1222')   | 17-214-233-1222 | Jenny         | 2019-01-02     | 2019-01-02 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1232')   | 17-214-233-1232 | Jenny         | 2019-01-02     | 2019-01-02 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1242')   | 17-214-233-1242 | Jenny         | 2019-01-02     | 2019-01-02 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1312')    | 17-214-233-1312 | Beth          | 2019-01-03     | 2019-01-03 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1222')    | 17-214-233-1222 | Beth          | 2019-01-03     | 2019-01-03 | *      |
      | md5('1002') | md5('1002\|\|BETH\|\|17-214-233-1232')    | 17-214-233-1232 | Beth          | 2019-01-03     | 2019-01-03 | *      |
      | md5('1003') | md5('1003\|\|CLAIRE\|\|17-214-233-1210')  | 17-214-233-1210 | Claire        | 2019-01-03     | 2019-01-03 | *      |
      | md5('1004') | md5('1004\|\|DAVID\|\|17-214-233-1216')   | 17-214-233-1216 | David         | 2019-01-03     | 2019-01-03 | *      |
      | md5('1004') | md5('1004\|\|DAVID\|\|17-214-233-1226')   | 17-214-233-1226 | David         | 2019-01-03     | 2019-01-03 | *      |
      | md5('1006') | md5('1006\|\|FREIA\|\|17-214-233-1212')   | 17-214-233-1212 | Freia         | 2019-01-03     | 2019-01-03 | *      |
      | md5('1002') | md5('1002\|\|BEAH\|\|17-214-233-1212')    | 17-214-233-1212 | Beah          | 2019-01-04     | 2019-01-04 | *      |
      | md5('1002') | md5('1002\|\|BEAH\|\|17-214-233-1222')    | 17-214-233-1222 | Beah          | 2019-01-04     | 2019-01-04 | *      |
      | md5('1002') | md5('1002\|\|BEAH\|\|17-214-233-1232')    | 17-214-233-1232 | Beah          | 2019-01-04     | 2019-01-04 | *      |
      | md5('1003') | md5('1003\|\|CHARLEY\|\|17-214-233-1223') | 17-214-233-1223 | Charley       | 2019-01-04     | 2019-01-04 | *      |
      | md5('1007') | md5('1007\|\|GEOFF\|\|17-214-233-1219')   | 17-214-233-1219 | Geoff         | 2019-01-04     | 2019-01-04 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1312')   | 17-214-233-1312 | Jenny         | 2019-01-04     | 2019-01-04 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1322')   | 17-214-233-1322 | Jenny         | 2019-01-04     | 2019-01-04 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1332')   | 17-214-233-1332 | Jenny         | 2019-01-04     | 2019-01-04 | *      |
      | md5('1010') | md5('1010\|\|JENNY\|\|17-214-233-1342')   | 17-214-233-1342 | Jenny         | 2019-01-04     | 2019-01-04 | *      |

  @fixture.multi_active_satellite_cycle
  @fixture.sha
  Scenario: [SAT-CYCLE-SHA] MULTI_ACTIVE_SATELLITE load over several cycles
    Given the RAW_STAGE stage is empty
    And the MULTI_ACTIVE_SATELLITE ma_sat is empty

    # ================ DAY 1 ===================
    And the RAW_STAGE is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1001        | Albert        | 2019-05-04     | 2019-05-04 | *      |
      | 1002        | Beth          | 2019-05-04     | 2019-05-04 | *      |
      | 1003        | Charley       | 2019-05-04     | 2019-05-04 | *      |
      | 1010        | Jenny         | 2019-05-04     | 2019-05-04 | *      |
      | 1012        | Albert        | 2019-05-04     | 2019-05-04 | *      |
    And I create the STG_CUSTOMER stage
    And I load the MULTI_ACTIVE_SATELLITE ma_sat

    # ================ DAY 2 ===================
    And the RAW_STAGE is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1002        | Beah          | 2019-05-05     | 2019-05-05 | *      |
      | 1003        | Chris         | 2019-05-05     | 2019-05-05 | *      |
      | 1004        | David         | 2019-05-05     | 2019-05-05 | *      |
      | 1010        | Jenny         | 2019-05-05     | 2019-05-05 | *      |
    And I create the STG_CUSTOMER stage
    And I load the MULTI_ACTIVE_SATELLITE ma_sat

    # ================ DAY 3 ===================
    And the RAW_STAGE is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1002        | Beth          | 2019-05-06     | 2019-05-06 | *      |
      | 1003        | Claire        | 2019-05-06     | 2019-05-06 | *      |
      | 1005        | Elwyn         | 2019-05-06     | 2019-05-06 | *      |
      | 1006        | Freia         | 2019-05-06     | 2019-05-06 | *      |
    And I create the STG_CUSTOMER stage
    And I load the MULTI_ACTIVE_SATELLITE ma_sat

    # ================ DAY 4 ===================
    And the RAW_STAGE is loaded
      | CUSTOMER_ID | CUSTOMER_NAME | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | 1002        | Beah          | 2019-05-07     | 2019-05-07 | *      |
      | 1003        | Charley       | 2019-05-07     | 2019-05-07 | *      |
      | 1007        | Geoff         | 2019-05-07     | 2019-05-07 | *      |
      | 1010        | Jenny         | 2019-05-07     | 2019-05-07 | *      |
      | 1011        | Karen         | 2019-05-07     | 2019-05-07 | *      |
    And I create the STG_CUSTOMER stage
    And I load the MULTI_ACTIVE_SATELLITE ma_sat

    # =============== CHECKS ===================
    Then the MULTI_ACTIVE_SATELLITE table should contain expected data
      | CUSTOMER_PK | HASHDIFF               | CUSTOMER_NAME | EFFECTIVE_FROM | LOAD_DATE  | SOURCE |
      | sha('1001') | sha('1001\|\|ALBERT')  | Albert        | 1990-02-03     | 2019-05-04 | *      |
      | sha('1002') | sha('1002\|\|BETH')    | Beth          | 1995-08-07     | 2019-05-04 | *      |
      | sha('1002') | sha('1002\|\|BEAH')    | Beah          | 1995-08-07     | 2019-05-05 | *      |
      | sha('1002') | sha('1002\|\|BETH')    | Beth          | 1995-08-07     | 2019-05-06 | *      |
      | sha('1002') | sha('1002\|\|BEAH')    | Beah          | 1995-08-07     | 2019-05-07 | *      |
      | sha('1003') | sha('1003\|\|CHARLEY') | Charley       | 1990-02-03     | 2019-05-04 | *      |
      | sha('1003') | sha('1003\|\|CHRIS')   | Chris         | 1990-02-03     | 2019-05-05 | *      |
      | sha('1003') | sha('1003\|\|CLAIRE')  | Claire        | 1990-02-03     | 2019-05-06 | *      |
      | sha('1003') | sha('1003\|\|CHARLEY') | Charley       | 1990-02-03     | 2019-05-07 | *      |
      | sha('1004') | sha('1004\|\|DAVID')   | David         | 1992-01-30     | 2019-05-05 | *      |
      | sha('1005') | sha('1005\|\|ELWYN')   | Elwyn         | 2001-07-23     | 2019-05-06 | *      |
      | sha('1006') | sha('1006\|\|FREIA')   | Freia         | 1960-01-01     | 2019-05-06 | *      |
      | sha('1007') | sha('1007\|\|GEOFF')   | Geoff         | 1990-02-03     | 2019-05-07 | *      |
      | sha('1010') | sha('1010\|\|JENNY')   | Jenny         | 1991-03-21     | 2019-05-04 | *      |
      | sha('1010') | sha('1010\|\|JENNY')   | Jenny         | 1991-03-25     | 2019-05-05 | *      |
      | sha('1011') | sha('1011\|\|KAREN')   | Karen         | 1978-06-16     | 2019-05-07 | *      |
      | sha('1012') | sha('1012\|\|ALBERT')  | Albert        | 1990-02-03     | 2019-05-04 | *      |