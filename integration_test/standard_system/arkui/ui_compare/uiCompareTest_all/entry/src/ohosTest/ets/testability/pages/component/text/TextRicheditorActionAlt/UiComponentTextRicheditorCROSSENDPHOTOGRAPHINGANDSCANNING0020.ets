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
 * 日志中支持查看服务状态码在当前光标处展示不同的气泡内容
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CROSS_END_PHOTOGRAPHING_AND_SCANNING_0020
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorCROSSENDPHOTOGRAPHINGANDSCANNING0020 {
  controller: RichEditorController = new RichEditorController();

  aboutToAppear(): void {
    this.controller.addTextSpan('RichEditor测试内容：日志中支持查看服务状态码在当前光标处展示不同的气泡内容', {
      style: { fontSize: 16 }
    });
  }

  build() {
    Scroll() {
      Column() {
        Text('日志中支持查看服务状态码在当前光标处展示不同的气泡内容')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CROSS_END_PHOTOGRAPHING_AND_SCANNING_0020')
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

        Text(`1、hdc hilog\n2、使用拍照扫描服务\n3、日志中搜索关键字(OnEvent)`)
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text(`3、可查看服务状态码在当前光标处展示不同的气泡内容 如：[service_collaboration_menu.cpp(OnEvent)-(-1:100000:singleton)] code is 1001202006, msg is 图片导入中....`)
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
