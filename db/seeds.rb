# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# users = [{uid: "jAAAAA", "crypto": "7QLji_wIST0FHwvzgYb6TCuRES1IZt6_-PSKmV28gcU"},
# 		 {uid: "jQAAAA", "crypto": "Alm-7L5uZPWLFRVn2SmsVMh-qj1ySaWzPx-2nkHAPtQ"},
# 		 {uid: "jgAAAA", "crypto": "zLfLMdzm4Rznf-H5Uk9FpTBBSiCURn17gvG8xk_vu0I"},
# 		 {uid: "jwAAAA", "crypto": "xL8vu9NlJZ1JwQC-TL4IMsr3C1RHI3-rAL8OEo7UTFM"},
# 		 {uid: "kAAAAA", "crypto": "2K5FQdkJ5lgFEfPMIfVGGOfux77J_jgJmPsUYast29k"},
# 		 {uid: "kQAAAA", "crypto": "awUWACd0CDeVbEyBS90EgTrlQKmtUaxWXZTA0uGkEnY"},
# 		 {uid: "kgAAAA", "crypto": "rnjR63S9_OHNPP-FR6Eo1j7v_R5HsSUc39Nn0Kuy3vw"},
# 		 {uid: "kwAAAA", "crypto": "j8Wuae6zoHKOGYVmJ1wCeeCA65X-5TMdJSu25WPQj6s"},
# 		 {uid: "lAAAAA", "crypto": "xXAWU4jHxBkdv1rtf3-dLzFfWZKG5WnNH2Us9RA9v3A"},
# 		 {uid: "lQAAAA", "crypto": "872hG9SbnS1lv9FpXiSz6PRVZ3ZCWDa5xmdJL4ffkUg"},
# 		 {uid: "lgAAAA", "crypto": "yNYCqktkHKdyxoay5NC-i-lgllGy1PufTUdccd5JVNY"},
# 		 {uid: "lwAAAA", "crypto": "f5TEVKnKcAwix--Fj07qMKO3MVYaZxm_EFL9kRYpJKM"},
# 		 {uid: "mAAAAA", "crypto": "8G-mitklJnT57VW4NWjp5cQN5qkufoqhHwHuGqMydjw"},
# 		 {uid: "mQAAAA", "crypto": "1Q8VsEgbhLYkrs3SBSMWslHmFd272WwFwz7GltUW0PY"},
# 		 {uid: "mgAAAA", "crypto": "dqIT7GCm1r6PdGOnXOGnOPkqNFxUuqzea4Pr9Ns9cgs"},
# 		 {uid: "mwAAAA", "crypto": "FvEzEC2rFWZxio0TR51VGJVMbfOnM7Afk69N086bnmo"},
# 		 {uid: "nAAAAA", "crypto": "gcoOhZ9HVfNLpVfQKa2cZBJKHNhJh6_iZUTIpTTiwmk"},
# 		 {uid: "nQAAAA", "crypto": "gjGRRUoYgSaPFMDlJpmkFqLw6tfiPdUjJqXZPy6KNrw"},
# 		 {uid: "ngAAAA", "crypto": "LaZHeWRoGcD2xMonwyDQlwCgC0y_0IOYFPlaaCyeKTk"},
# 		 {uid: "nwAAAA", "crypto": "mvU9A-_SHGxF6S-PSe5ipeuLKugv2jHwIZuAFSN-4S4"}
# 		]

users = JSON.parse('[
{"uid":"jAAAAA","crypto":"7QLji_wIST0FHwvzgYb6TCuRES1IZt6_-PSKmV28gcU"},
{"uid":"jQAAAA","crypto":"Alm-7L5uZPWLFRVn2SmsVMh-qj1ySaWzPx-2nkHAPtQ"},
{"uid":"jgAAAA","crypto":"zLfLMdzm4Rznf-H5Uk9FpTBBSiCURn17gvG8xk_vu0I"},
{"uid":"jwAAAA","crypto":"xL8vu9NlJZ1JwQC-TL4IMsr3C1RHI3-rAL8OEo7UTFM"},
{"uid":"kAAAAA","crypto":"2K5FQdkJ5lgFEfPMIfVGGOfux77J_jgJmPsUYast29k"},
{"uid":"kQAAAA","crypto":"awUWACd0CDeVbEyBS90EgTrlQKmtUaxWXZTA0uGkEnY"},
{"uid":"kgAAAA","crypto":"rnjR63S9_OHNPP-FR6Eo1j7v_R5HsSUc39Nn0Kuy3vw"},
{"uid":"kwAAAA","crypto":"j8Wuae6zoHKOGYVmJ1wCeeCA65X-5TMdJSu25WPQj6s"},
{"uid":"lAAAAA","crypto":"xXAWU4jHxBkdv1rtf3-dLzFfWZKG5WnNH2Us9RA9v3A"},
{"uid":"lQAAAA","crypto":"872hG9SbnS1lv9FpXiSz6PRVZ3ZCWDa5xmdJL4ffkUg"},
{"uid":"lgAAAA","crypto":"yNYCqktkHKdyxoay5NC-i-lgllGy1PufTUdccd5JVNY"},
{"uid":"lwAAAA","crypto":"f5TEVKnKcAwix--Fj07qMKO3MVYaZxm_EFL9kRYpJKM"},
{"uid":"mAAAAA","crypto":"8G-mitklJnT57VW4NWjp5cQN5qkufoqhHwHuGqMydjw"},
{"uid":"mQAAAA","crypto":"1Q8VsEgbhLYkrs3SBSMWslHmFd272WwFwz7GltUW0PY"},
{"uid":"mgAAAA","crypto":"dqIT7GCm1r6PdGOnXOGnOPkqNFxUuqzea4Pr9Ns9cgs"},
{"uid":"mwAAAA","crypto":"FvEzEC2rFWZxio0TR51VGJVMbfOnM7Afk69N086bnmo"},
{"uid":"nAAAAA","crypto":"gcoOhZ9HVfNLpVfQKa2cZBJKHNhJh6_iZUTIpTTiwmk"},
{"uid":"nQAAAA","crypto":"gjGRRUoYgSaPFMDlJpmkFqLw6tfiPdUjJqXZPy6KNrw"},
{"uid":"ngAAAA","crypto":"LaZHeWRoGcD2xMonwyDQlwCgC0y_0IOYFPlaaCyeKTk"},
{"uid":"nwAAAA","crypto":"mvU9A-_SHGxF6S-PSe5ipeuLKugv2jHwIZuAFSN-4S4"}
]')


users.each_with_index do |user, index|
	User.create(:email => "user#{index}@yworld.com", 
				:password => "123456", 
				:uid => user["uid"], 
				:crypto => user["crypto"] ) ;
end