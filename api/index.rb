require "json"

Handler = Proc.new do |req, res|

  # body = data_hash["zaps"].map do |zap|
  #   nodes = zap["nodes"].values.map { |node| { action: node["action"], selected_api: node["selected_api"] } }
  #   {title: zap["title"], nodes: nodes}
  # end

  body = [{ :title => "New Quorum Group", :nodes => [{ :action => "row_custom_query", :selected_api => "PostgreSQLAPI" }, { :action => "direct_message", :selected_api => "SlackAPI" }] }, { :title => "New Quorum User", :nodes => [{ :action => "row", :selected_api => "PostgreSQLAPI" }, { :action => "direct_message", :selected_api => "SlackAPI" }] }, { :title => "User logged in", :nodes => [{ :action => "hook", :selected_api => "WebHookAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "What the Hack", :nodes => [{ :action => "hook", :selected_api => "WebHookAPI" }, { :action => "util_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "number_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "smsv2", :selected_api => "TwilioAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Paid Group Created", :nodes => [{ :action => "row_custom_query", :selected_api => "PostgreSQLAPI" }, { :action => "filter", :selected_api => "FilterAPI" }, { :action => "message", :selected_api => "GoogleMailV2API" }] }, { :title => "Active Admins", :nodes => [{ :action => "hook", :selected_api => "WebHookAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "New Membership Text", :nodes => [{ :action => "row_custom_query", :selected_api => "PostgreSQLAPI" }, { :action => "filter", :selected_api => "FilterAPI" }, { :action => "smsv2", :selected_api => "TwilioAPI" }] }, { :title => "Admin Dashboard Flow", :nodes => [{ :action => "hook", :selected_api => "WebHookAPI" }, { :action => "branch", :selected_api => "BranchingAPI" }, { :action => "filter", :selected_api => "BranchingAPI" }, { :action => "filter", :selected_api => "BranchingAPI" }, { :action => "branch", :selected_api => "BranchingAPI" }, { :action => "filter", :selected_api => "BranchingAPI" }, { :action => "filter", :selected_api => "BranchingAPI" }, { :action => "smsv2", :selected_api => "TwilioAPI" }, { :action => "smsv2", :selected_api => "TwilioAPI" }, { :action => "branch", :selected_api => "BranchingAPI" }, { :action => "filter", :selected_api => "BranchingAPI" }, { :action => "filter", :selected_api => "BranchingAPI" }, { :action => "smsv2", :selected_api => "TwilioAPI" }, { :action => "smsv2", :selected_api => "TwilioAPI" }] }, { :title => "Momentum Sign up", :nodes => [{ :action => "newRecord", :selected_api => "AirtableCLIAPI@1.9.2" }, { :action => "channel_message", :selected_api => "SlackAPI" }, { :action => "filter", :selected_api => "FilterAPI" }, { :action => "smsv2", :selected_api => "TwilioAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Download prompt", :nodes => [{ :action => "hook", :selected_api => "WebHookAPI" }, { :action => "smsv2", :selected_api => "TwilioAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Public Link text", :nodes => [{ :action => "hook", :selected_api => "WebHookAPI" }, { :action => "util_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "util_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "smsv2", :selected_api => "TwilioAPI" }] }, { :title => "User B1 sent a message", :nodes => [{ :action => "hook", :selected_api => "WebHookAPI" }, { :action => "filter", :selected_api => "FilterAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "New subscription", :nodes => [{ :action => "charge_v3", :selected_api => "StripeAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Scheduled Message", :nodes => [{ :action => "updated_row_notify_hook", :selected_api => "GoogleSheetsV2API" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "New Call Scheduled", :nodes => [{ :action => "invitee_created", :selected_api => "CalendlyCLIAPI@1.0.0" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Email collection + Prompt ", :nodes => [{ :action => "form_submission", :selected_api => "WebflowDevAPI" }, { :action => "add_row", :selected_api => "GoogleSheetsV2API" }, { :action => "delay_for", :selected_api => "DelayAPI" }, { :action => "lookup_row", :selected_api => "GoogleSheetsV2API" }, { :action => "filter", :selected_api => "FilterAPI" }, { :action => "message", :selected_api => "GoogleMailV2API" }] }, { :title => "Blog subscriber", :nodes => [{ :action => "form_submission", :selected_api => "WebflowDevAPI" }, { :action => "create_customer", :selected_api => "CustomerIOV2CLIAPI@1.0.2" }] }, { :title => "Send SMS Messages via Email", :nodes => [{ :action => "inbound", :selected_api => "ZapierMailAPI" }, { :action => "smsv2", :selected_api => "TwilioAPI" }] }, { :title => "Dan's Add to ActiveCampaign", :nodes => [{ :action => "row_custom_query", :selected_api => "PostgreSQLAPI" }, { :action => "action_4", :selected_api => "ActiveCampaignCLIAPI@1.9.7" }] }, { :title => "On Social Boom membership (Kajabi + remove from ActiveCampaign)", :nodes => [{ :action => "row_custom_query", :selected_api => "PostgreSQLAPI" }, { :action => "activate_offer", :selected_api => "KajabiDevAPI" }] }, { :title => "Remove card details", :nodes => [{ :action => "hook", :selected_api => "WebHookAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Social Boom Affiliate Programme", :nodes => [{ :action => "form_submission", :selected_api => "WebflowDevAPI" }, { :action => "row", :selected_api => "PostgreSQLAPI" }, { :action => "message", :selected_api => "GoogleMailV2API" }] }, { :title => "New Mona User", :nodes => [{ :action => "row", :selected_api => "PostgreSQLAPI" }, { :action => "text_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "message", :selected_api => "GoogleMailV2API" }, { :action => "channel_message", :selected_api => "SlackAPI" }, { :action => "createRecord", :selected_api => "AirtableCLIAPI@1.9.2" }, { :action => "add_row", :selected_api => "GoogleSheetsV2API" }, { :action => "add_digest", :selected_api => "DigestAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Year in Twitter - Stats Complete", :nodes => [{ :action => "hook_v2", :selected_api => "WebHookAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }, { :action => "add_row", :selected_api => "GoogleSheetsV2API" }] }, { :title => "Year in Chat - Final Statistics", :nodes => [{ :action => "hook_v2", :selected_api => "WebHookAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }, { :action => "add_row", :selected_api => "GoogleSheetsV2API" }] }, { :title => "Email on Twitter", :nodes => [{ :action => "hook_v2", :selected_api => "WebHookAPI" }, { :action => "add_row", :selected_api => "GoogleSheetsV2API" }] }, { :title => nil, :nodes => [{ :action => nil, :selected_api => nil }, { :action => nil, :selected_api => nil }] }, { :title => "Twitter + Whatsapp Numbers", :nodes => [{ :action => "mention", :selected_api => "SlackAPI" }, { :action => "find_many_rows", :selected_api => "GoogleSheetsV2API" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Pending Invite > Kajabi", :nodes => [{ :action => "row_custom_query", :selected_api => "PostgreSQLAPI" }, { :action => "activate_offer", :selected_api => "KajabiDevAPI" }] }, { :title => "Event service created", :nodes => [{ :action => "hook_v2", :selected_api => "WebHookAPI" }, { :action => "datetime_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "datetime_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "detailed_event", :selected_api => "GoogleCalendarAPI" }] }, { :title => "Romy - Mona USER", :nodes => [{ :action => "reaction", :selected_api => "SlackAPI" }, { :action => "text_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "createRecord", :selected_api => "AirtableCLIAPI@1.9.2" }] }, { :title => "David - Mona USER", :nodes => [{ :action => "reaction", :selected_api => "SlackAPI" }, { :action => "text_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "createRecord", :selected_api => "AirtableCLIAPI@1.9.2" }] }, { :title => "Patrick - Mona USER", :nodes => [{ :action => "reaction", :selected_api => "SlackAPI" }, { :action => "text_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "createRecord", :selected_api => "AirtableCLIAPI@1.9.2" }] }, { :title => "Devin - Mona USER", :nodes => [{ :action => "reaction", :selected_api => "SlackAPI" }, { :action => "text_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "createRecord", :selected_api => "AirtableCLIAPI@1.9.2" }] }, { :title => "Eoghan - Mona USER", :nodes => [{ :action => "reaction", :selected_api => "SlackAPI" }, { :action => "text_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "createRecord", :selected_api => "AirtableCLIAPI@1.9.2" }] }, { :title => "Stripe for MONA", :nodes => [{ :action => "charge_v3", :selected_api => "StripeAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Adding Owner to Airtable", :nodes => [{ :action => "newRecord", :selected_api => "AirtableCLIAPI@1.9.2" }, { :action => "findRecord", :selected_api => "AirtableCLIAPI@1.9.2" }, { :action => "updateRecord", :selected_api => "AirtableCLIAPI@1.9.2" }] }, { :title => "Mega User", :nodes => [{ :action => "reaction", :selected_api => "SlackAPI" }, { :action => "text_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "update_row", :selected_api => "PostgreSQLAPI" }] }, { :title => "Miriam's Ebook Zap", :nodes => [{ :action => "row_custom_query", :selected_api => "PostgreSQLAPI" }, { :action => "message", :selected_api => "GoogleMailV2API" }] }, { :title => "Add new Typeform response as a Customer.io event", :nodes => [{ :action => "entries_resthook_v2", :selected_api => "TypeformCLIAPI@1.0.17" }, { :action => "row", :selected_api => "PostgreSQLAPI" }, { :action => "track_event", :selected_api => "CustomerIOV2CLIAPI@1.0.2" }] }, { :title => "Unclaimed Revenue", :nodes => [{ :action => "hook_v2", :selected_api => "WebHookAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Miriam PRESALE", :nodes => [{ :action => "hook_v2", :selected_api => "WebHookAPI" }, { :action => "message", :selected_api => "GoogleMailV2API" }] }, { :title => nil, :nodes => [{ :action => "hook_v2", :selected_api => "WebHookAPI" }, { :action => "create_customer", :selected_api => "CustomerIOV2CLIAPI@1.0.2" }] }, { :title => "Multiple Books", :nodes => [{ :action => "entries_resthook_v2", :selected_api => "TypeformCLIAPI@1.0.17" }, { :action => "text_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "message", :selected_api => "GoogleMailV2API" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Trisha's Subscribers", :nodes => [{ :action => "row", :selected_api => "PostgreSQLAPI" }, { :action => "filter", :selected_api => "FilterAPI" }, { :action => "add_row", :selected_api => "GoogleSheetsV2API" }] }, { :title => "Mona Kitchens Sign Up", :nodes => [{ :action => "entries_resthook_v2", :selected_api => "TypeformCLIAPI@1.0.17" }, { :action => "text_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "message", :selected_api => "GoogleMailV2API" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Roz's Q&A Typeform", :nodes => [{ :action => "entries_resthook_v2", :selected_api => "TypeformCLIAPI@1.0.17" }, { :action => "add_row", :selected_api => "GoogleSheetsV2API" }, { :action => "add_digest", :selected_api => "DigestAPI" }] }, { :title => nil, :nodes => [{ :action => "updated_row_notify_hook", :selected_api => "GoogleSheetsV2API" }, { :action => "filter", :selected_api => "FilterAPI" }, { :action => "update_live_item", :selected_api => "WebflowDevAPI" }] }, { :title => "Trisha Bookings", :nodes => [{ :action => "row_custom_query", :selected_api => "PostgreSQLAPI" }, { :action => "add_digest", :selected_api => "DigestAPI" }, { :action => "number_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "number_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }, { :action => nil, :selected_api => "StripeAPI" }] }, { :title => "Roz Bookings", :nodes => [{ :action => "row_custom_query", :selected_api => "PostgreSQLAPI" }, { :action => "add_digest", :selected_api => "DigestAPI" }, { :action => "number_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "number_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Stat Update", :nodes => [{ :action => "mention", :selected_api => "SlackAPI" }, { :action => "digest", :selected_api => "DigestAPI" }, { :action => "row_custom_query", :selected_api => "PostgreSQLAPI" }, { :action => "digest", :selected_api => "DigestAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "New booking", :nodes => [{ :action => "hook_v2", :selected_api => "WebHookAPI" }, { :action => "branch", :selected_api => "BranchingAPI" }, { :action => "filter", :selected_api => "BranchingAPI" }, { :action => "filter", :selected_api => "BranchingAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }, { :action => "branch", :selected_api => "BranchingAPI" }, { :action => "filter", :selected_api => "BranchingAPI" }, { :action => "filter", :selected_api => "BranchingAPI" }, { :action => "add_digest", :selected_api => "DigestAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }, { :action => "add_digest", :selected_api => "DigestAPI" }, { :action => "number_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }, { :action => "util_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Roz Feedback", :nodes => [{ :action => "entries_resthook_v2", :selected_api => "TypeformCLIAPI@1.0.17" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Trisha Feedback", :nodes => [{ :action => "entries_resthook_v2", :selected_api => "TypeformCLIAPI@1.0.17" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Suppressed Emails", :nodes => [{ :action => "hook_v2", :selected_api => "WebHookAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }, { :action => "add_row", :selected_api => "GoogleSheetsV2API" }] }, { :title => "End of course survey (Trisha)", :nodes => [{ :action => "entries_resthook_v2", :selected_api => "TypeformCLIAPI@1.0.17" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Support Schedule", :nodes => [{ :action => "everyDay", :selected_api => "ScheduleCLIAPI@1.1.0" }, { :action => "increment_value", :selected_api => "StorageCLIAPI@1.2.0" }, { :action => "number_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "util_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Support Schedule (Weekend - Founders)", :nodes => [{ :action => "everyDay", :selected_api => "ScheduleCLIAPI@1.1.0" }, { :action => "filter", :selected_api => "FilterAPI" }, { :action => "increment_value", :selected_api => "StorageCLIAPI@1.2.0" }, { :action => "number_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "util_line_item", :selected_api => "ZapierFormatterDevAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }, { :title => "Email Bounce Notifications", :nodes => [{ :action => "hook_v2", :selected_api => "WebHookAPI" }, { :action => "channel_message", :selected_api => "SlackAPI" }] }]

  res.status = 200
  res["Content-Type"] = "application/json"
  res.body = body
end
