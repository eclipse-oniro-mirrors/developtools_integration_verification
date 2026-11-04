/* Licensed under the Apache License, Version 2.0 */
/*---
desc: Simple assignment to an unresolvable reference
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0143: Unresolved reference __ES3_1_test_suite_test_11_13_1_unique_id_0__"]
---*/
function main(): void {
    __ES3_1_test_suite_test_11_13_1_unique_id_0__.x = 42;
}
