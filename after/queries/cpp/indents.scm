; extends

; namespace bodies are indented (clang-format NamespaceIndentation: All)
(namespace_definition
  body: (declaration_list) @indent.begin)

; preprocessor directives stay in column 0 (IndentPPDirectives: None)
[
  "#include"
  (preproc_directive)
] @indent.zero

; "case X:" already indents; its braced block must not indent twice
(case_statement
  (compound_statement) @indent.dedent)
