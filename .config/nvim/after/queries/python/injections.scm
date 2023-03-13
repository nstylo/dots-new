(call 
  function: (identifier) @_func (#eq? @_func "text")
  (argument_list . (string) @sql)
)

(call 
  function: (attribute 
    object: (identifier) @_obj (#any-of? @_obj "sqlalchemy" "sa")
    attribute: (identifier) @_attr (#eq? @_attr "text")
  )
  (argument_list . (string) @sql)
)

(call 
  function: (attribute 
    object: (identifier) @_obj (#any-of? @_obj "connection" "conn")
    attribute: (identifier) @_attr (#eq? @_attr "execute")
  )
  (argument_list . (string) @sql)
)

(call 
  function: (identifier) @_func (#eq? @_func "gql")
  (argument_list . (string) @sql)
)
