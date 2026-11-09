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
struct ComponentTextTextUI0580 {
  @State textAlign: TextAlign = TextAlign.Start;

  build() {
    Column() {
      Text('ComponentTextTextUI0580_1\nComponent_2\nTextTextUI0580_3')
        .textAlign(this.textAlign)
      Button('TextAlign.Center')
        .margin({ top: 30 })
        .height(40)
        .id('ComponentTextTextUI0580_001')
        .onClick(() => {
          this.textAlign = TextAlign.Center;
        })
    }
    .width('100%')
    .height('100%')
  }
}
