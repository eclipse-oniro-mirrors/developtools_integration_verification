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
 * @id EXP2_17_16_003_PASS_INSTANCEOF_BRANCH
 * @expect compile-pass
 * @section 17.16
 * @design 基于 instanceof 的条件分支——模拟模式匹配的类型分发
 * @note 正向用例：验证在 if-else 分支中使用 instanceof 实现类型分发编译通过
 */
class Shape {
  public name: string = 'shape'
}
class Circle extends Shape {
  public radius: double = 1.0
}
class Rect extends Shape {
  public width: double = 1.0
  public height: double = 1.0
}

function processShape(s: Shape): string {
  if (s instanceof Circle) {
    return 'circle'
  } else if (s instanceof Rect) {
    return 'rect'
  } else {
    return 'unknown'
  }
}

function testInstanceofBranch(): void {
  let c: Shape = new Circle()
  let r: Shape = new Rect()
  console.log('c=' + processShape(c) + ' r=' + processShape(r))
}
