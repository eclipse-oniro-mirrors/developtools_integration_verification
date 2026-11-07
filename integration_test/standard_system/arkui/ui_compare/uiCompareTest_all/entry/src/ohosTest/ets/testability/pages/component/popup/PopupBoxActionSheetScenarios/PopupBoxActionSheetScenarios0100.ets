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
struct PopupBoxActionSheetScenarios0100 {

  build() {
    Column() {
      Button('点击弹出ActionSheet')
        .id('popup_button_scenarios_0100')
        .onClick(() => {
          // 步骤2：不传参数直接调用ActionSheet.show() - 这会导致编译报错
          // ActionSheet.show() 需要必需参数，不传参数会导致编译报错
          // ActionSheet.show()
        })
        .margin(20)
      
      Text('验证未填写内容编译报错')
        .fontSize(16)
        .margin(10)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
