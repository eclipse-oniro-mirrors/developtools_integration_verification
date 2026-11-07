/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

let bigObj: Record<number, number> = {}
let temp: number[] = Array.from(new Array(100).keys())
temp.forEach(item => {
  bigObj[item] = item;
})
@ObservedV2
class B {
  @Trace arr: string[] = ['a', 'b']
  @Trace bb: string = 'cccc'
  constructor(bb: string) {
    this.bb = bb;
  }
}
@Entry
@ComponentV2
struct Page21 {
  @Local a: Record<number, number> = {1: 1};
  @Local b: B = new B('qqq')
  build() {
    Column() {
      Text(`${JSON.stringify(this.a)}`)
      Text(`${this.b.bb}`)
      Button('change a').onClick(() => {
        this.a = bigObj
      }).id('ca')
      Button('change b').onClick(() => {
        this.b = new B(`wwww`)//上报Local
      }).id('cb')
      Button('change b.arr').onClick(() => {
        this.b.arr.push('ddd')//方案1 没有装饰器、属性名、所属组件
      }).id('cba')
      Button('change b.bb').onClick(() => {
        this.b.bb= 'ccc'//上报的Trace
      }).id('abb')
      Button('change b.aa=new arr').onClick(() => {
        this.b.arr= ['ccc']//上报的Trace
      }).id('cba_n')
    }
    .height('100%')
    .width('100%')
  }
}
