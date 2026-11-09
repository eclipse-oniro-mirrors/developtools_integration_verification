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
@ComponentV2
export struct MenuTouch0080 {
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TOUCH_0080')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：切后台/home/自由窗口`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button(`调起菜单`)
        .id('btn')
        .bindMenu([
          { value: '菜单项1', action: () => { this.testStatus = '✅ 点击了菜单项1'; } },
          { value: '菜单项2', action: () => { this.testStatus = '✅ 点击了菜单项2'; } },
          { value: '菜单项3', action: () => { this.testStatus = '✅ 点击了菜单项3'; } }
        ])

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 设置一个menu组件\n2. 编译hap包并执行\n3. 将应用切后台/点击home键/切换到自由窗口，再切换回来\n4. 手指长按菜单选项，然后抬起`)
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：手指长按后显示按压态；手指抬起后按压态消失`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

