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
struct DialogSpecificationsUi0040 {
  @State count1: number = 0;
  @State count2: number = 0;

  build() {
    Flex({ alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap }) {
      Column(){
        Row(){
          Text('Circle+border({ radius})')
            .fontSize(9)
            .fontColor(0xCCCCCC)
          Text(`${this.count1}`)
            .fontSize(9)
            .fontColor(0xCCCCCC)
          Button({ type: ButtonType.Circle, stateEffect: true }) {
            LoadingProgress()
              .width(20)
              .height(20)
              .color(0xFFFFFF)
          }
          .border({radius: 30})
          .backgroundColor(0x317aff)
          .id('DialogSpecificationsUi0040_001')
          .onClick(()=>{
            this.count1++;
          })
        }
        Row(){
          Text('Circle+border({ radius})')
            .fontSize(9)
            .fontColor(0xCCCCCC)
          Text(`${this.count2}`)
            .fontSize(9)
            .fontColor(0xCCCCCC)
          Button({ type: ButtonType.Circle, stateEffect: true }) {
            LoadingProgress()
              .width(20)
              .height(20)
              .color(0xFFFFFF)
          }
          .border({radius: 30})
          .margin({ left: 20 })
          .backgroundColor(0xF55A42)
          .id('DialogSpecificationsUi0040_002')
          .onClick(()=>{
            this.count2++;
          })
        }
      }

    }
  }
}


