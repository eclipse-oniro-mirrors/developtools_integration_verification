/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
// Java Runtime Test - 对应 LEX_02_01_034 运行时用例
// 测试因子checklist: overload/override/dynamic dispatch - Unicode方法在继承中的多态

class 动物 {
    String 名称 = "动物";
    String 描述() { return "我是" + this.名称; }
    String 叫声() { return "..."; }
}

class 猫 extends 动物 {
    猫() { this.名称 = "猫"; }
    String 叫声() { return "喵喵"; }
}

class 狗 extends 动物 {
    狗() { this.名称 = "狗"; }
    String 叫声() { return "汪汪"; }
}

public class UnicodeInheritanceTest {
    public static void main(String[] args) {
        猫 猫实例 = new 猫();
        狗 狗实例 = new 狗();

        assert 猫实例.描述().equals("我是猫") : "Unicode override: cat describe mismatch";
        assert 猫实例.叫声().equals("喵喵") : "Unicode override: cat sound mismatch";
        assert 狗实例.描述().equals("我是狗") : "Unicode override: dog describe mismatch";
        assert 狗实例.叫声().equals("汪汪") : "Unicode override: dog sound mismatch";

        // Dynamic dispatch
        动物 动物引用1 = new 猫();
        动物 动物引用2 = new 狗();

        assert 动物引用1.叫声().equals("喵喵") : "Unicode polymorphism: dynamic dispatch cat mismatch";
        assert 动物引用2.叫声().equals("汪汪") : "Unicode polymorphism: dynamic dispatch dog mismatch";

        System.out.println("=== Unicode Inheritance Test PASSED ===");
    }
}