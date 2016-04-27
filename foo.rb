options = {
  assignment_re: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
  multiple_values: true
}

describe parse_config_file('foo', options ) do
  its('gpg') { should cmp 1 }
  its('gpgcheck') { should cmp 1 }
end
