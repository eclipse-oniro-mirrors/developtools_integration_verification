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
struct DialogActionsheet0080 {

  build() {
    Column() {
      Text('验证ActionSheet.show()中非必填参数的非必填性')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)

      Button('非必填参数验证')
        .id('show_actionsheet_optional_params_0080')
        .fontSize(16)
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          // ActionSheet.show()中不配置非必填参数：subtitle、autoCancel、confirm、cancel、alignment、offset、maskRect、showInSubWindow、isModal、backgroundColor、backgroundBlurStyle
          // 只配置必填参数：title、message、sheets
          ActionSheet.show({
            title: '弹窗标题',
            message: '弹窗内容',
            sheets: [
              {
                title: '列表项1',
                action: () => {
                  console.log('选择了列表项1')
                }
              },
              {
                title: '列表项2',
                action: () => {
                  console.log('选择了列表项2')
                }
              },
              {
                title: '列表项3',
                action: () => {
                  console.log('选择了列表项3')
                }
              }
            ]
          })
        })

      Text('说明：此按钮点击时会调用ActionSheet.show()，只配置必填参数')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ top: 10, bottom: 20 })
        .padding({ left: 20, right: 20 })

      Divider()
        .margin({ bottom: 20 })

      Text('测试步骤')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })

      Column() {
        Text('1. ActionSheet.show()中不配置非必填参数')
          .fontSize(14)
          .margin({ bottom: 8 })
          .alignSelf(ItemAlign.Start)

        Text('   - 不配置：subtitle、autoCancel、confirm、cancel')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('   - 不配置：alignment、offset、maskRect')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('   - 不配置：showInSubWindow、isModal')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('   - 不配置：backgroundColor、backgroundBlurStyle')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ bottom: 10 })
          .alignSelf(ItemAlign.Start)

        Text('2. 运行此ets页面，查看是否报错')
          .fontSize(14)
          .margin({ bottom: 8 })
          .alignSelf(ItemAlign.Start)

        Text('3. 进入demo，点击非必填参数验证的按钮进入页面，点击页面中的按钮')
          .fontSize(14)
          .margin({ bottom: 8 })
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding({ left: 20, right: 20 })

      Divider()
        .margin({ top: 20, bottom: 20 })

      Text('预期结果')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })

      Column() {
        Text('2. 编译不报错')
          .fontSize(14)
          .fontColor(Color.Green)
          .margin({ bottom: 8 })
          .alignSelf(ItemAlign.Start)

        Text('3. 弹出弹窗，显示：')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('   - 弹窗标题title')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 3 })
          .alignSelf(ItemAlign.Start)

        Text('   - 弹窗内容message')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 3 })
          .alignSelf(ItemAlign.Start)

        Text('   - 列表项sheets')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 3 })
          .alignSelf(ItemAlign.Start)

        Text('   - 弹窗默认有蒙层、垂直底部对齐')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 8 })
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding({ left: 20, right: 20 })

      Text('当前页面状态：已加载完成，编译无错误')
        .fontSize(14)
        .fontColor(Color.Green)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })
        .padding({ left: 20, right: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
    .padding(20)
  }
}
