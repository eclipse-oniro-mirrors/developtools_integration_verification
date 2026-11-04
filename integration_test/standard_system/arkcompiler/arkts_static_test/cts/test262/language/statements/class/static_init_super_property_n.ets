/* Licensed under the Apache License, Version 2.0 */
/*---
desc: The home object for a class static initialization block is the parent class
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0202: 'super' cannot be referenced from a static context"]
---*/

// Conversion notes: P 源（static 块 super 属性指向父类）；super 静态访问不可表达（ESE0202）
class Parent {
    public static test262: string = 'test262';
}
class C extends Parent {
    static {
        let value: string = super.test262;
    }
}

