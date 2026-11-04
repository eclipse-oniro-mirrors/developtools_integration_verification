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
 * @id CLS_09_10_023_RUNTIME_FIELD_OVERRIDE
 * @expect runtime
 * @section 9.10
 * @design 运行时验证字段重写：派生类同名字段改变初始化值，运行时使用派生类初始值
 * @note 运行时用例：三级继承链中每层都可重写同名字段，验证最终实例字段值为最派生类的初始值
 */
class Layer {
  public value: int = 1
  public label: string = "base"

  public getInfo(): string {
    return this.label + "=" + this.value
  }
}

class MiddleLayer extends Layer {
  value: int = 10

  constructor() {
    super()
    this.label = "middle"
  }
}

class TopLayer extends MiddleLayer {
  value: int = 100

  constructor() {
    super()
    this.label = "top"
  }
}

function main(): void {
  let l: Layer = new Layer()
  if (l.value != 1) {
    throw new Error("Layer.value failed: " + l.value)
  }
  if (l.label != "base") {
    throw new Error("Layer.label failed: " + l.label)
  }
  if (l.getInfo() != "base=1") {
    throw new Error("Layer.getInfo failed: " + l.getInfo())
  }

  let ml: MiddleLayer = new MiddleLayer()
  if (ml.value != 10) {
    throw new Error("MiddleLayer.value failed: " + ml.value)
  }
  if (ml.label != "middle") {
    throw new Error("MiddleLayer.label failed: " + ml.label)
  }
  if (ml.getInfo() != "middle=10") {
    throw new Error("MiddleLayer.getInfo failed: " + ml.getInfo())
  }

  let tl: TopLayer = new TopLayer()
  if (tl.value != 100) {
    throw new Error("TopLayer.value failed: " + tl.value)
  }
  if (tl.label != "top") {
    throw new Error("TopLayer.label failed: " + tl.label)
  }
  if (tl.getInfo() != "top=100") {
    throw new Error("TopLayer.getInfo failed: " + tl.getInfo())
  }

  let ref: Layer = tl
  if (ref.value != 100) {
    throw new Error("field override via base ref failed: " + ref.value)
  }
  if (ref.getInfo() != "top=100") {
    throw new Error("getInfo via base ref failed: " + ref.getInfo())
  }

  console.log("field override verified")
}
