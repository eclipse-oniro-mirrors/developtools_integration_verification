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
export struct MenuBlur007 {
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_007')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：bindmenu入参为MenuElement-API10`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`预置条件：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`• ets页面中加入button组件\n• 通过点击事件弹出bindmenu（入参为MenuElement）\n• 写入5个菜单项`)
        .fontSize(13)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Divider()

      Button('点击弹出菜单（bindMenu-MenuElement）')
        .id('btn')
        .bindMenu([
          {
            value: '菜单项1',
            action: () => {
              this.testStatus = '✅ 点击了菜单项1';
            }
          },
          {
            value: '菜单项2',
            action: () => {
              this.testStatus = '✅ 点击了菜单项2';
            }
          },
          {
            value: '菜单项3',
            action: () => {
              this.testStatus = '✅ 点击了菜单项3';
            }
          },
          {
            value: '菜单项4',
            action: () => {
              this.testStatus = '✅ 点击了菜单项4';
            }
          },
          {
            value: '菜单项5',
            action: () => {
              this.testStatus = '✅ 点击了菜单项5';
            }
          }
        ])

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击button组件，查看弹出的一级菜单\n2. 通过ArkUI Inspector查看MenuWrapper节点下的Menu节点的backgroundBlurStyle的value值\n3. 通过ArkUI Inspector查看MenuWrapper节点下的MenuItem节点的backgroundBlurStyle的value值`)
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 背景没有模糊\n2. 值为空\n3. 值为空`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`说明：`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`本测试验证API10的bindMenu（MenuElement）无模糊材质。需通过ArkUI Inspector查看backgroundBlurStyle属性为空。`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

