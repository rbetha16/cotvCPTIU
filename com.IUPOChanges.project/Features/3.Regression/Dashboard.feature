#Author: your.email@your.domain.comm
@Regression @IUDashboard
Feature: IU Dashboard
  @StatusTracking1
  Scenario: Rule Search Report
    Given user logs into "QA" with "iht_ittest01" into Interpretive Update Application
    When user navigate to IU "ICD-Interpretive Rule Update" Instances Screen
    And user navigate to IU "ICD10-Reports" Instances Screen
    When user navigate to IU Report Screen "Rule Search Report"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Final MD Review" for "Not Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "QA Review" for "Not Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Final MD Review" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "CPM Review" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "CPM Review" for "Not Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Editorial Review" for "Not Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Testing Review" for "Not Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Configuration Review" for "Not Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "CPM Review - Testing Return" for "Not Started"

  @StatusTracking2
  Scenario: Rule Search Report2
    Given user logs into "QA" with "iht_ittest01" into Interpretive Update Application
    When user navigate to IU "ICD-Interpretive Rule Update" Instances Screen
    And user navigate to IU "ICD10-Reports" Instances Screen
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "QA Review - CPM Response" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Final MD Review - Configuration Return" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "QA Review - Config Return" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "QA Review - Configuration Response" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Final MD Review - QA Return" for "Not Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Testing Review - CPM Response" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "QA Review - Editorial Response" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Editorial Review - CPM Response" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Configuration Review - Final MD Response" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Configuration Review - QA Response" for "Started"
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Rule Search Report" RunType "Intial Run" "Search Rule"
    Then validate Search Rule "Potential Conflicts Review" for "Not Started"

  @StatusTracking3
  Scenario: Rule Search Report3
    Given user logs into "QA" with "iht_ittest01" into Interpretive Update Application
    When user navigate to IU "ICD-Interpretive Rule Update" Instances Screen
    And user navigate to IU "ICD10-Reports" Instances Screen
    When user navigate to IU Report Screen "Status Tracker"
    And user select Report "Manual RMR Report" RunType "Intial Run" "Search Rule"
    Then user validate "Manual RMR Report" and respective columns
    Then validate Search Rule "ManualRMRReport" for "Manual RMR"

  
  @UsernameSearchReport
  Scenario: validating Username Search Report
    Given user logs into "QA" with "iht_ittest01" into Interpretive Update Application
    When user navigate to IU "ICD-Interpretive Rule Update" Instances Screen
    And user navigate to IU "ICD10-Reports" Instances Screen
    When user navigate to IU Report Screen " User Name Task Report"
    And user select Report "User Name Task Report" RunType "Initial Run" "iht_ittest01" ""
    Then validate "Username Search Report"

  #When user navigate to IU Report Screen " User Name Task Report"
  #And user select Report "User Name Task Report" RunType "Subsequent Run 1" "iht_ittest01" ""
  #Then validate "Username Search Report"
  
  
  @StatusTracking5
  Scenario Outline: WorkProgress Report for CustomRule
    Given user logs into "QA" with "iht_ittest01" into Interpretive Update Application
    When user navigate to IU "ICD-Interpretive Rule Update" Instances Screen
    And user navigate to IU "ICD10-Reports" Instances Screen
    When user navigate to IU Report Screen "Status Tracker"
    Then user validate Role "Policy Owner" and  TaskType "RULEREVIEW" and Status "Pending"
    And user switch to "Task Mangement" Page
    And user navigate to IU "ICD10-MyTasks" Instances Screen
    When user click on "MD Review Work Queue" for "FINAL MD DEL" Instance
    And Apply filters in My Task and Retrive Rule in DB "ANYPROPOSALRULE" and "<FilterValue>"
    And select "RuleID"
    And click on "Start Review"
    And select System Proposal "All""No Action"
    And click on "Generate Summaries"
    When user complete the Authorization Decision with "Retire Rule-a"
    And user switch to "Report Screen" Page
    Then user validate Role "Policy Owner" and  TaskType "RULEREVIEW" and Status "Validate"
    Then user validate Role "Policy Owner" and  TaskType "CPM" and Status "Pending"
    And user switch to "Task Mangement" Page
    And user navigate to IU "ICD10-MyTasks" Instances Screen
    When user click on "CPM Review Work Queue" for "FINAL MD DEL" Instance
    And select "RuleID"
    And click on "Start Review"
    When user Complete CPM Decesion "Agree"
    And click on "Generate Summaries"
    When user complete the Authorization Decision with "Do Not Retire Rule"
    And user switch to "Report Screen" Page
    Then user validate Role "Policy Owner" and  TaskType "CPM" and Status "Validate"
    Then user validate Role "Policy Owner" and  TaskType "Editorial Team" and Status "Pending"
    And user switch to "Task Mangement" Page
    Then Verify Assigned user and claim the rule
    Given user logs into "QA" with "SERENITY" into Interpretive Update Application
    When user navigate to IU "ICD-Interpretive Rule Update" Instances Screen
    And user navigate to IU "ICD10-MyTasks" Instances Screen
    When user click on "Editorial Review Work Queue" for "FINAL MD DEL" Instance
    And select "RuleID"
    And click on "Start Review"
    Then Complete Editorial review with "<Changes>"
    Then user validate Role "Policy Owner" and  TaskType "Editorial Team" and Status "Validate"
      

    Examples: 
      | FiterName        | FilterValue                            |
      | FilterTaskStatus | Custom;Not Started;Final MD Review;REV |

  
