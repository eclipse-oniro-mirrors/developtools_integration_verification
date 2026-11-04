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
// Swift Runtime Test - 对应 LEX_02_01_032~036 运行时用例
// 测试因子checklist: 局部/全局书写、类型转换、参数上下文、继承多态、集合容器

// Unicode Scope Test
var 全局计数: Int = 10

func 局部递增(增量: Int) -> Int {
    let 局部结果 = 全局计数 + 增量
    return 局部结果
}

class 计算器 {
    var 私有值: Int = 0
    func 累加(数值: Int) -> Int {
        let 方法局部 = 私有值 + 数值
        私有值 = 方法局部
        return 方法局部
    }
}

// Unicode Inheritance Test
class 动物 {
    var 名称: String = "动物"
    func 描述() -> String { return "我是" + 名称 }
    func 叫声() -> String { return "..." }
}

class 猫: 动物 {
    override init() { super.init(); 名称 = "猫" }
    override func 叫声() -> String { return "喵喵" }
}

class 狗: 动物 {
    override init() { super.init(); 名称 = "狗" }
    override func 叫声() -> String { return "汪汪" }
}

// Main
let 结果1 = 局部递增(增量: 5)
assert(结果1 == 15, "Unicode scope: local+global mismatch")

let 结果2 = 局部递增(增量: 10)
assert(结果2 == 20, "Unicode scope: local+global mismatch")

let 计 = 计算器()
let 结果3 = 计.累加(数值: 100)
assert(结果3 == 100, "Unicode scope: class method mismatch")

let 结果4 = 计.累加(数值: 50)
assert(结果4 == 150, "Unicode scope: class method mismatch")

// Inheritance Test
let 猫实例 = 猫()
let 狗实例 = 狗()
assert(猫实例.描述() == "我是猫", "Unicode override: cat describe mismatch")
assert(猫实例.叫声() == "喵喵", "Unicode override: cat sound mismatch")
assert(狗实例.描述() == "我是狗", "Unicode override: dog describe mismatch")
assert(狗实例.叫声() == "汪汪", "Unicode override: dog sound mismatch")

// Dynamic dispatch
let 动物引用1: 动物 = 猫()
let 动物引用2: 动物 = 狗()
assert(动物引用1.叫声() == "喵喵", "Unicode polymorphism: dynamic dispatch cat mismatch")
assert(动物引用2.叫声() == "汪汪", "Unicode polymorphism: dynamic dispatch dog mismatch")

// Collection Test
var 中文数组: [String] = ["苹果", "香蕉", "橘子"]
assert(中文数组[0] == "苹果", "Unicode array: first element mismatch")
assert(中文数组.count == 3, "Unicode array: length mismatch")

var 数值映射: [String: Int] = [:]
数值映射["一"] = 1
数值映射["二"] = 2
数值映射["三"] = 3
assert(数值映射["一"] == 1, "Unicode Map: value mismatch")
assert(数值映射["二"] == 2, "Unicode Map: value mismatch")

print("=== Swift Unicode Test ALL PASSED ===")