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

/**
 * 日志测试
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DFXREINFORCIN_0002
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorDFXREINFORCIN0002 {
  controller: RichEditorController = new RichEditorController();

  aboutToAppear(): void {
    this.controller.addTextSpan('RichEditor测试内容：日志测试', {
      style: { fontSize: 16 }
    });
  }

  build() {
    Scroll() {
      Column() {
        Text('日志测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DFXREINFORCIN_0002')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 10 })

        RichEditor({ controller: this.controller })
          .width('95%')
          .height(150)
          .border({ width: 1, color: '#ddd' })
          .borderRadius(5)
          .margin({ bottom: 10 })

        Text('测试步骤：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text(`1、电脑连接手机进入hdc shell界面\n2、输入hilog|grep \'C0391A\'/AceRichText开启RichEditor debug日志\n3、根据开发提供的日志场景（失焦、获焦、复制、剪切、粘贴、全选、点击、长按、鼠标悬停、手势返回、撤销、重做、关菜单、光标变化、添加span属性、更新span样式、显示菜单）进行操作`)
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text(`3、存在相应日志`)
          .fontSize(10)
          .width('95%')
          .fontColor('#FF6B35')
          .margin({ bottom: 15 })

        Button('测试完成')
          .id('btn')
          .width('80%')
          .onClick(() => {
            // 截图测试
          })

        Text('说明: 复杂场景请手动验证')
          .fontSize(9)
          .fontColor('#999')
          .margin({ top: 10 })
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}
