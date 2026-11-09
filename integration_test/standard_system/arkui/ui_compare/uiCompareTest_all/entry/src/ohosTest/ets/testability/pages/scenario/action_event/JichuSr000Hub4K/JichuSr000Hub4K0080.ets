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

import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct JichuSr000Hub4K0080 {
  @State resultText: string = '测试结果将在此显示'

  showActionMenuWithWrongTextType() {
    try {
      // buttons中text设置为错误类型number，验证编译报错
      promptAction.showActionMenu({
        title: '测试ActionMenu',
        buttons: [
          {
            text: '12345', // 故意设置为number类型 - 此处应该导致编译报错
            color: '#FF0000'
          },
          {
            text: '67890', // 故意设置为number类型
            color: '#00FF00'
          }
        ]
      });
      this.resultText = 'ActionMenu显示成功（不应该执行到这里）'
    } catch (error) {
      let message = (error as BusinessError).message;
      let code = (error as BusinessError).code;
      this.resultText = `错误码: ${code}, 错误信息: ${message}`
    }
  }

  build() {
    Column() {
      // 标题区域
      Column() {
        Text('buttons中text类型错误验证')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
        Text('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0080')
          .fontSize(12)
          .fontColor('#CCCCCC')
          .margin({ top: 4 })
      }
      .width('100%')
      .padding({ top: 40, bottom: 20 })
      .backgroundColor('#4A90D9')

      // 内容区域
      Column() {
        Text('测试说明')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .width('100%')
          .margin({ top: 16, bottom: 8 })

        Text('验证promptAction.showActionMenu下的buttons中参数text设置为错误类型：number')
          .fontSize(14)
          .fontColor('#666666')
          .width('100%')
          .margin({ bottom: 16 })

        Text('预置条件')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .width('100%')
          .margin({ bottom: 8 })

        Text('buttons中参数text设置为错误类型：number')
          .fontSize(14)
          .fontColor('#666666')
          .width('100%')
          .padding(12)
          .backgroundColor('#FFF3E0')
          .borderRadius(8)
          .margin({ bottom: 16 })

        Text('预期结果')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .width('100%')
          .margin({ bottom: 8 })

        Text('编译报错')
          .fontSize(14)
          .fontColor('#D32F2F')
          .width('100%')
          .padding(12)
          .backgroundColor('#FFEBEE')
          .borderRadius(8)
          .margin({ bottom: 16 })

        // 结果显示区域
        Text('执行结果')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .width('100%')
          .margin({ top: 16, bottom: 8 })

        Text(this.resultText)
          .fontSize(14)
          .fontColor('#333333')
          .width('100%')
          .padding(12)
          .backgroundColor('#E3F2FD')
          .borderRadius(8)
          .margin({ bottom: 16 })

        // 触发按钮
        Button('执行测试')
          .id('show_action_menu_btn_0080')
          .width('100%')
          .height(50)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .backgroundColor('#4A90D9')
          .borderRadius(25)
          .onClick(() => {
            this.showActionMenuWithWrongTextType()
          })
          .margin({ bottom: 20 })
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 20 })
      .layoutWeight(1)
      .backgroundColor('#F0F2F5')
    }
    .width('100%')
    .height('100%')
  }
}

