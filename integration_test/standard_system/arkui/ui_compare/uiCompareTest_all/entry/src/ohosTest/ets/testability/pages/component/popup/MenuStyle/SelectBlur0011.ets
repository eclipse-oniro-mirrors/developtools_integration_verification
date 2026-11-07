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
export struct SelectBlur0011 {
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_011')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：select-API10`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Select([
        { value: '菜单项1' },
        { value: '菜单项2' },
        { value: '菜单项3' },
        { value: '菜单项4' },
        { value: '菜单项5' }
      ])
        .selected(0)
        .value('请选择')
        .font({ size: 16 })
        .onSelect((index: number) => {
          this.testStatus = `✅ 选中：菜单项${index + 1}`;
        })

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button(`验证`)
        .id('btn')
        .onClick(() => {
          this.testStatus = '✅ Select组件已创建，点击下拉菜单查看';
        })

      Divider()

      Text(`预期结果：背景没有模糊，backgroundBlurStyle值为空`)
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

