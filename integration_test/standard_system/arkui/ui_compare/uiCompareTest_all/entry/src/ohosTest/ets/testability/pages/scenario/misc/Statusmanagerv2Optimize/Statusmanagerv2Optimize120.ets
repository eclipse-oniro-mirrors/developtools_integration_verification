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

@Component
struct CompD {
  @Consume selectedDate: Date;
  @Consume message: Map<number, string>
  @Consume message_set: Set<number>
  @Consume privateArray: string[]

  build() {
    Column() {
      ForEach(Array.from(this.message.entries()), (item: [number, string]) => {
        Text(`${item[0]}`).fontSize(30)
        Text(`${item[1]}`).fontSize(30)
        Divider()
      })
      Button(`refresh`)
        .onClick(() => {
          this.selectedDate.setDate(this.selectedDate.getDate() + 1)
          this.message.set(4, 'd')
          this.message_set.add(5)
          this.privateArray.push('D')
        })
        .id('btn')
    }
  }
}

@Entry
@Component
struct CompA {
  @Provide selectedDate: Date = new Date('2021-08-08')
  @Provide message: Map<number, string> = new Map([[0, 'a'], [1, 'b'], [3, 'c']])
  @Provide message_set: Set<number> = new Set([0, 1, 2, 3, 4])
  @Provide privateArray: string[] = ['A', 'B', 'C'];

  build() {
    Column() {
      Button('refresh')
        .margin(10)
        .onClick(() => {
        })
      CompD()
    }
  }
}
