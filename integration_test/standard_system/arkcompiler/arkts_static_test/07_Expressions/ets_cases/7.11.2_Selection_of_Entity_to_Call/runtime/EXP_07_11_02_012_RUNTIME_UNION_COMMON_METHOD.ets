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
/**
 * @id EXP_07_11_02_012_RUNTIME_UNION_COMMON_METHOD
 * @expect runtime
 * @section 7.11.2
 * @design Union 类型公共方法运行时行为：JsonFormatter | XmlFormatter union 类型调用公共 format 方法，运行时分发到实际类型
 * @note 运行时用例：验证 union 类型 T = JsonFormatter|XmlFormatter 调用公共方法 format 的运行时正确性
 */
class JsonFormatter {
    format(): string {
        return '{json: true}'
    }
}

class XmlFormatter {
    format(): string {
        return '<xml/>'
    }
}

function formatUnion(f: JsonFormatter | XmlFormatter): string {
    return f.format()
}

function main(): void {
    let j: JsonFormatter = new JsonFormatter()
    let x: XmlFormatter = new XmlFormatter()

    let r1: string = formatUnion(j)
    if (r1 != '{json: true}') {
        throw new Error('assertion failed: expected json, got ' + r1)
    }

    let r2: string = formatUnion(x)
    if (r2 != '<xml/>') {
        throw new Error('assertion failed: expected xml, got ' + r2)
    }
console.log('verified')
}
