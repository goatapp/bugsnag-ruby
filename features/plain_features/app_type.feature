Feature: App type configuration option

Background:
  Given I set environment variable "BUGSNAG_API_KEY" to "a35a2a72bd230ac0aa0f52715bbdc6aa"
  And I configure the bugsnag endpoint

Scenario Outline: The App type configuration option can be set
  Given I set environment variable "RUBY_VERSION" to "<ruby version>"
  And I set environment variable "BUGSNAG_APP_TYPE" to "test_app"
  And I have built the service "plain-ruby"
  And I run the service "plain-ruby" with the command "bundle exec ruby configuration/send_handled.rb"
  And I wait for 1 second
  Then I should receive a request
  And the request used the "Ruby Bugsnag Notifier" notifier
  And the request used payload v4 headers
  And the request contained the api key "a35a2a72bd230ac0aa0f52715bbdc6aa"
  And the event "app.type" equals "test_app"

  Examples:
  | ruby version |
  | 1.9.3        |
  | 2.0          |
  | 2.1          |
  | 2.2          |
  | 2.3          |
  | 2.4          |
  | 2.5          |