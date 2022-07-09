# Funcky Functions

> Funcky provides a set of functions (wrapped in the command pattern) that perform simple actions

## List of categories

| Name | Description |
|-|-|
{{#each categories}}
| {{titleize name}} | {{description}} |
{{/each}}

## List of functions

| Category | Name | Alias | Description |
|-|-|-|-|
{{#each functions}}
| {{titleize category}} | `{{name}}` | {{#each alias}}{{surround . '`' '` '}}{{/each}} | {{description}} |
{{/each}}
