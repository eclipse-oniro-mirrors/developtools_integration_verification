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
struct ArkuiComponentfunctionCommomattributesMenuShadowset0200 {
  build() {
    Column() {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0200')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0200')

      Text('测试说明：\n验证直板机在浅色模式下，select下拉菜单的阴影显示正常')
        .fontSize(14)
        .margin({ bottom: 30 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Select([
        { value: '选项1' },
        { value: '选项2' },
        { value: '选项3' }
      ])
        .id('select_menu_0200')
        .selected(0)
        .value('请选择')
        .font({ size: 16, weight: FontWeight.Medium })
        .fontColor(Color.Black)
        .selectedOptionFont({ size: 16, weight: FontWeight.Regular })
        .optionFont({ size: 16, weight: FontWeight.Regular })
        .width(300)
        .margin({ bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

