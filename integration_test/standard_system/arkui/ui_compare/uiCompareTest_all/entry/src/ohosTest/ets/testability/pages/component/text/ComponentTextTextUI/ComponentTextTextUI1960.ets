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
@Entry
@Component
struct ComponentTextTextUI1960 {
  @State fontWeight:	FontWeight | number | string=FontWeight.Bold
  build() {
    Column(){
      Text('ComponentTextTextUI1960')
        .fontWeight(this.fontWeight)
      Button('fontWeight(-600)')
        .margin({ top: 30 })
        .height(40)
        .id('ComponentTextTextUI1960_001')
        .onClick(() => {
          this.fontWeight = -600;
        })
    }
    .width('100%')
    .height('100%')
  }
}
