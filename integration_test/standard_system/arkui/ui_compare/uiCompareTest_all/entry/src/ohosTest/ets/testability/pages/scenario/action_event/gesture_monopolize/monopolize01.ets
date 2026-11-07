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
struct Monopolize01 {
  @State message: string = 'set monopolizeEvents false'
  @State messageOut: string = ' '
  @State messageInner: string = ' '
  @State monopolize: boolean = false

  build() {
    Column() {
      Text(this.message)
        .fontSize(22)
        .margin(10)
      Text(this.messageOut)
        .fontSize(22)
        .margin(10)
      Text(this.messageInner)
        .fontSize(22)
        .margin(10)
      Button('clean')
        .fontSize(22)
        .margin(10)
          // 通过button的点击事件来切换内层column的独占控制属性
        .onClick(()=>{
          this.messageOut = ' '
          this.messageInner = ' '
        })
      Column() {
        Column(){}
        // this.monopolize是true时，点击内层column只会触发自身的触摸事件，不会触发外层column的触摸事件
        // this.monopolize是false时，点击内层column会同时触发自身的触摸事件和外层column的触摸事件
        .monopolizeEvents(this.monopolize)
        .width('100%')
        .height('40%')
        .backgroundColor(Color.Blue)
        .id('innerColumn01')
        // 内层column绑定触摸事件
        .onTouch((event:TouchEvent)=>{
          if (event.type == TouchType.Down) {
            console.log('inner column touch down')
            this.messageInner = 'inner column touch down'
          }
        })
      }
      .backgroundColor(Color.Gray)
      .height('100%')
      .width('100%')
      // 外层column绑定触摸事件
      .onTouch((event)=>{
        if (event.type == TouchType.Down) {
          console.log('outside column touch down')
          this.messageOut = 'inner column touch down'
        }
      })
    }
    .height('100%')
  }
}
