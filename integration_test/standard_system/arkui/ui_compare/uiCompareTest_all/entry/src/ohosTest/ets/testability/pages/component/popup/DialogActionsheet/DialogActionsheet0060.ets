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
struct DialogActionsheet0060 {

  build() {
    Column() {
      Text('验证ActionSheet中showInSubWindow设置为false')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('showInSubWindow_false')
        .id('show_actionsheet_subwindow_false_0060')
        .fontSize(16)
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          // showInSubWindow设置为false
          ActionSheet.show({
            title: '列表选择弹窗',
            subtitle: '副标题',
            message: '这是消息内容',
            showInSubWindow: false,
            sheets: [
              {
                title: '选项1',
                action: () => {
                  console.log('选择了选项1')
                }
              },
              {
                title: '选项2',
                action: () => {
                  console.log('选择了选项2')
                }
              },
              {
                title: '选项3',
                action: () => {
                  console.log('选择了选项3')
                }
              }
            ],
            cancel: () => {
              console.log('取消操作')
            }
          })
        })

      Text('说明：此按钮点击时会调用ActionSheet.show()，showInSubWindow设置为false')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ top: 10 })
        .padding({ left: 20, right: 20 })

      Text('预期结果：列表选择弹窗不可以在子窗口显示，将在主窗口中显示')
        .fontSize(14)
        .fontColor(Color.Blue)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })
        .padding({ left: 20, right: 20 })

      Divider()
        .margin({ top: 30, bottom: 30 })

      Text('当前页面状态')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })

      Text('页面已加载，可以点击上方按钮测试ActionSheet显示效果')
        .fontSize(14)
        .fontColor(Color.Green)
        .textAlign(TextAlign.Center)
        .padding({ left: 20, right: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
    .padding(20)
  }
}
