# HCB fixtures

`device.hcs` is the source for the two committed binaries. Generated using the
workspace's `out/rk3568/obj/drivers/interface/tools/hc-gen/hc-gen` (HCB 0.7):

```bash
hc-gen -o compact.hcb device.hcs
hc-gen -a -o aligned.hcb device.hcs
```

The binaries are independent of the Python reader and the test mutation encoder.
They cover all integer widths, arrays, an empty array, embedded quotes, a node
reference, and a moduleName outside the manager. The ref offsets differ with
alignment. Tests compare the resolved node's actual offset, not equal byte layouts.
The generator is required only when regenerating these fixtures, not at test time.
