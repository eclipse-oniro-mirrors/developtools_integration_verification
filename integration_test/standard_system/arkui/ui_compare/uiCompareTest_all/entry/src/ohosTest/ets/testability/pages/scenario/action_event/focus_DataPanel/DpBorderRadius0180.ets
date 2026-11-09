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
struct SimpleDataPanel0180 {
  @State tright: number = 5
  @State tleft: number = 5
  @State bright: number = 5
  @State bleft: number = 5

  build() {
    Column() {
      DataPanel({
        values: [1],
        max: 100,
        type: DataPanelType.Line,
      })
        .width('80%')
        .height(24)
        .borderRadius({topLeft:this.tleft,topRight:this.tright,bottomLeft:this.bleft ,bottomRight:this.bright})
        .backgroundColor('#EEEEEE')
        .padding(10)

      Button('点击测试')
        .id('DpBR0180')
        .onClick(()=>{ this.tright = 10.5; this.tleft = 5;this.bright = 100;this.bleft = 0 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5');

  }
}

