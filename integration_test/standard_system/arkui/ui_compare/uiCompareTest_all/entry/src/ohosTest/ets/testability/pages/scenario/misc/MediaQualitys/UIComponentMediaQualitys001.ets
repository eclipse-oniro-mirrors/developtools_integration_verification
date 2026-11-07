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
struct UIComponentMediaQualitys001 {
  @State message: string = 'Hello'
  @State maskMessage: string = 'UIComponentMediaQualitys001'
  @State fontSize: number = 20;
  index: number = 0;
  @State obscuredReasonNumber: number = ObscuredReasons.PLACEHOLDER;

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontColor(Color.Blue)
          .height('10%')
          .margin({ top: 20 })
          .key('UIComponentMediaQualitys001_001')
        Text(this.maskMessage)
          .fontSize(this.fontSize)
          .obscured([this.obscuredReasonNumber])
        Button('切换隐私遮罩')
          .id('change')
          .onClick(() => {
              this.index++;
              if(this.index % 2 === 1) {
                this.obscuredReasonNumber = -1;
                this.fontSize = 40;
              } else {
                this.obscuredReasonNumber = ObscuredReasons.PLACEHOLDER;
                this.fontSize = 20;
              }
          })
          .height(70)
          .width(100)
          .stateEffect(true)
      }
      .width('100%')
      .height('100%')
    }
  }
}