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
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
export struct Navigation01 {
  @State str1:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();
  @State titleBar:boolean = false
  @State toolBar:boolean = false

  build() {
    Column({space:5}){
      Navigation(this.pageInfos) {
        Column({space:10})
          .width('90%')
          .height('100%')
          .backgroundColor(Color.Pink)
      }
      .margin({top:20})
      .width('80%')
      .height('50%')
      .borderWidth(1)
      .mode(NavigationMode.Stack)
      .title('NavigationTitle', {paddingStart: LengthMetrics.vp(50), paddingEnd: LengthMetrics.vp(50)})
      .id('Navigation01')
      .hideTitleBar(this.titleBar)
      .hideToolBar(this.toolBar)
      .toolbarConfiguration([
        { value: 'a' },
        { value: 'b' },
        { value: 'c' }
      ])

      Button('change hideTitleBar')
        .margin({top:20})
        .fontSize(20)
        .id('changeHideTitleBar01')
        .onClick(() => {
          this.titleBar = true
        })
      Button('change hideToolBar')
        .margin({top:20})
        .fontSize(20)
        .id('changeHideToolBar01')
        .onClick(() => {
          this.toolBar = true
        })
    }.width('100%')
  }
}
