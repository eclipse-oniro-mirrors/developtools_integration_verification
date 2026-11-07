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
struct DialogActionsheet0700 {

  build() {
    Column() {
      Text('浅色模式下actionSheet视觉显示符合UX规范')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)

      Button('显示ActionSheet（浅色模式）')
        .id('show_actionsheet_light_mode_0700')
        .fontSize(16)
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .backgroundColor(Color.Blue)
        .fontColor(Color.White)
        .onClick(() => {
          // 编译gitee上actionSheet组件资料里示例1的代码
          ActionSheet.show({
            title: '标题',
            subtitle: '副标题',
            message: '这是一个ActionSheet弹窗示例',
            autoCancel: true,
            confirm: {
              defaultFocus: true,
              value: '确认',
              action: () => {
                console.log('点击了确认按钮')
              }
            },
            cancel: () => {
              console.log('点击了取消按钮')
            },
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
            sheets: [
              {
                title: '选项一',
                action: () => {
                  console.log('选择了选项一')
                }
              },
              {
                title: '选项二',
                action: () => {
                  console.log('选择了选项二')
                }
              },
              {
                title: '选项三',
                action: () => {
                  console.log('选择了选项三')
                }
              },
              {
                title: '选项四',
                action: () => {
                  console.log('选择了选项四')
                }
              }
            ]
          })
        })

      Text('说明：此按钮点击时会显示完整的ActionSheet弹窗示例')
        .fontSize(14)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .margin({ top: 10, bottom: 20 })
        .padding({ left: 20, right: 20 })

      Divider()
        .color('#E0E0E0')
        .margin({ bottom: 20 })

      Text('测试步骤')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })
        .fontColor(Color.Black)

      Column() {
        Text('1. 编译gitee上actionSheet组件资料里示例1的代码')
          .fontSize(14)
          .margin({ bottom: 8 })
          .alignSelf(ItemAlign.Start)
          .fontColor('#333333')

        Text('2. 浅色模式下查看列表选择弹窗显示')
          .fontSize(14)
          .margin({ bottom: 8 })
          .alignSelf(ItemAlign.Start)
          .fontColor('#333333')
      }
      .width('100%')
      .padding({ left: 20, right: 20 })

      Divider()
        .color('#E0E0E0')
        .margin({ top: 20, bottom: 20 })

      Text('预期结果')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })
        .fontColor(Color.Black)

      Text('actionSheet的视觉显示与基线图保持一致，符合UX规范')
        .fontSize(14)
        .fontColor('#007AFF')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
        .padding({ left: 20, right: 20 })

      Text('浅色模式特性')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })
        .fontColor(Color.Black)

      Column() {
        Text('• 背景色为浅色主题')
          .fontSize(14)
          .margin({ bottom: 5 })
          .alignSelf(ItemAlign.Start)
          .fontColor('#666666')

        Text('• 文字颜色适配浅色主题')
          .fontSize(14)
          .margin({ bottom: 5 })
          .alignSelf(ItemAlign.Start)
          .fontColor('#666666')

        Text('• 按钮样式适配浅色主题')
          .fontSize(14)
          .margin({ bottom: 5 })
          .alignSelf(ItemAlign.Start)
          .fontColor('#666666')

        Text('• 分割线颜色适配浅色主题')
          .fontSize(14)
          .margin({ bottom: 5 })
          .alignSelf(ItemAlign.Start)
          .fontColor('#666666')

        Text('• 蒙层效果适配浅色主题')
          .fontSize(14)
          .margin({ bottom: 5 })
          .alignSelf(ItemAlign.Start)
          .fontColor('#666666')

        Text('• 清晰的视觉层次和对比度')
          .fontSize(14)
          .margin({ bottom: 5 })
          .alignSelf(ItemAlign.Start)
          .fontColor('#666666')
      }
      .width('100%')
      .padding({ left: 20, right: 20 })

      Text('当前页面状态：浅色模式已启用，可以点击按钮测试ActionSheet显示效果')
        .fontSize(14)
        .fontColor('#00C851')
        .textAlign(TextAlign.Center)
        .margin({ top: 30 })
        .padding({ left: 20, right: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#FFFFFF') // 浅色背景
    .padding(20)
  }
}
