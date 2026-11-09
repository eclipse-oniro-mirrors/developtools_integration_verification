/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct ArkUIComponentFunctionAdvancedComponentsMirror025 {
  @State value: string[] = ['0', '1', '2']
  @State compDirection: Direction = Direction.Ltr
  build() {
    Column() {
      Button('Direction.Rtl')
        .borderWidth(1)
        .id('DirectionRtl')
        .onClick(() => {
          this.compDirection = Direction.Rtl
        })
      Button('Direction.Auto')
        .borderWidth(1)
        .id('DirectionAuto')
        .onClick(() => {
          this.compDirection = Direction.Auto
        })
      Button('Direction.Ltr')
        .borderWidth(1)
        .id('DirectionLtr')
        .onClick(() => {
          this.compDirection = Direction.Ltr
        })
      Counter() {
        Text(this.value[0])
        Text(this.value[1])
        Text(this.value[2])
      }
      .margin(100)
      .direction(this.compDirection)
    }.width('100%')
  }
}
