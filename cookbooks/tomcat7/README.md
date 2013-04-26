tomcat7 Cookbook
=================

This cookbook installs and configures tomcat7.

Requirements
------------
#### packages
- `java` - tomcat7 needs java.
- `ark`

Attributes
----------
#### tomcat7::default

Usage
-----
#### tomcat7::default
TODO: Write usage instructions for each cookbook.

Just include `tomcat7` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[tomcat7]"
  ]
}
```