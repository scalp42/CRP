fuse-esb Cookbook
=================

This cookbook installs and configures fuse-esb.

Requirements
------------
#### packages
- `java` - fuse-esb needs java.
- `ark`

Attributes
----------
#### fuse-esb::default

Usage
-----
#### fuse-esb::default
TODO: Write usage instructions for each cookbook.

Just include `fuse-esb` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fuse-esb]"
  ]
}
```