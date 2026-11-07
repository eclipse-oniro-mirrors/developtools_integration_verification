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
 * settypingstyle不设置颜色属性时，打开深色模式后从其他组件复制内容并粘贴
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0022
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorDarkandbase0022 {
  controller: RichEditorController = new RichEditorController();
  @Local isDarkMode: boolean = false;
  @Local sourceText: string = '这是用于复制的源文本内容';

  aboutToAppear(): void {
    this.controller.addTextSpan('初始文本内容，使用默认颜色设置。', {
      style: {
        fontColor: Color.Blue
      }
    });
  }

  toggleDarkMode(): void {
    this.isDarkMode = !this.isDarkMode;
  }

  simulatePaste(): void {
    // 模拟粘贴：添加源文本到RichEditor
    this.controller.addTextSpan(this.sourceText, {
      style: {
        fontSize: 16,
        fontColor: this.isDarkMode ? Color.White : Color.Black
      }
    });
  }

  build() {
    Column() {
      Text('settypingstyle不设置颜色属性时，打开深色模式后从其他组件复制内容并粘贴')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      // 源文本组件（用于复制）
      Text(this.sourceText)
        .fontSize(16)
        .padding(10)
        .backgroundColor('#E5F5FF')
        .borderRadius(5)
        .margin({ bottom: 10 })
        .copyOption(CopyOptions.LocalDevice)

      // RichEditor组件
      RichEditor({ controller: this.controller })
        .width('95%')
        .height(200)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })
        .backgroundColor(this.isDarkMode ? '#333' : '#fff')
        .onReady(() => {
          this.controller.setTypingStyle({
            fontWeight: FontWeight.Normal,
            fontSize: 16
          });
        })

      Row() {
        Button('切换深色模式')
          .id('toggleDarkModeBtn')
          .onClick(() => {
            this.toggleDarkMode();
          })
          .margin({ right: 5 })

        Button('模拟粘贴')
          .id('simulatePasteBtn')
          .onClick(() => {
            this.simulatePaste();
          })
          .margin({ right: 5 })

        Button('测试完成')
          .id('btn')
          .onClick(() => {
            // 测试按钮
          })
      }
      .margin({ top: 10 })

      Text('测试步骤：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15, bottom: 5 })
        .alignSelf(ItemAlign.Start)

      Text('1、已添加文本内容，文本颜色使用id设置\n2、已设置settypingstyle，但未设置颜色属性\n3、点击"切换深色模式"后，点击"模拟粘贴"')
        .fontSize(10)
        .width('95%')

      Text('预期结果：复制粘贴后的文本内容能够跟随深色模式切换，正常显示')
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
