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
 * @id CLS_09_07_024_RUNTIME_ABSTRACT_MULTILEVEL
 * @expect runtime
 * @section 9.7.3
 * @design 抽象方法多级继承运行时派发：多层abstract类链中，最终子类实现抽象方法并通过基类引用调用
 * @note 正向用例：验证多级抽象继承链中的方法派发，基类引用正确调用叶子类的实现
 */
abstract class Layer1 {
  abstract getName(): string
  abstract getValue(): int
}

abstract class Layer2 extends Layer1 {
  abstract getName(): string
  abstract getValue(): int
  abstract getTag(): string
}

class ConcreteLeaf extends Layer2 {
  getName(): string {
    return "ConcreteLeaf"
  }

  getValue(): int {
    return 42
  }

  getTag(): string {
    return "leaf"
  }
}

function processLayer1(layer: Layer1): string {
  let name: string = layer.getName()
  let val: int = layer.getValue()
  let result: string = name + ":" + val.toString()
  return result
}

function processLayer2(layer: Layer2): string {
  let name: string = layer.getName()
  let val: int = layer.getValue()
  let tag: string = layer.getTag()
  let result: string = name + ":" + val.toString() + ":" + tag
  return result
}

function main(): void {
  let leaf: ConcreteLeaf = new ConcreteLeaf()

  // Test dispatch through Layer1 reference
  let layer1: Layer1 = leaf
  let result1: string = processLayer1(layer1)
  if (result1 == "ConcreteLeaf:42") {
    console.log("verified")
  }

  // Test dispatch through Layer2 reference
  let layer2: Layer2 = leaf
  let result2: string = processLayer2(layer2)
  if (result2 == "ConcreteLeaf:42:leaf") {
    console.log("verified")
  }

  // Test direct access
  let directName: string = leaf.getName()
  let directVal: int = leaf.getValue()
  let directTag: string = leaf.getTag()
  if (directName == "ConcreteLeaf" && directVal == 42 && directTag == "leaf") {
    console.log("verified")
  }
}
