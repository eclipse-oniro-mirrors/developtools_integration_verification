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
struct UIAttributesInterfaceReconstitution068 {
  @State widthPercent: string = '50%';
  @State heightPercent: string = '20%';
  private caseName: string = 'SUB_ACE_UI_ATTRIBUTES__INTERFACE_RECONSTITUTION_0730';

  build() {
    Column() {
      Row() {
        Column() {
          Column() {
            Text('renderFit值为undefined')
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
          }
          .margin(20)
          Text('A')
            .width(this.widthPercent)
            .height(this.heightPercent)
            .borderWidth(1)
            .renderFit(undefined)
            .margin(20)
        }.height('80%').width('50%').justifyContent(FlexAlign.Center)
        Column() {
          Column() {
            Text('renderFit值为正常值RenderFit.RIGHT')
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
          }
          .margin(20)
          Text('A')
            .width(this.widthPercent)
            .height(this.heightPercent)
            .textAlign(TextAlign.End)
            .borderWidth(1)
            .renderFit(RenderFit.RIGHT)
            .margin(20)
        }.height('80%').width('50%').justifyContent(FlexAlign.Center)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('90%')
      Button('改变宽高')
        .id('change')
        .stateEffect(true)
        .onClick(() => {
          this.widthPercent = '90%';
          this.heightPercent = '50%';
          console.info(`${this.caseName} widthPercent is ${this.widthPercent}`);
          console.info(`${this.caseName} hrightPercent is ${this.heightPercent}`);
        })
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}