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
struct DialogActionsheet0050 {

  build() {
    Column() {
      Text('验证ActionSheet中subtitle设置为异常值')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('显示ActionSheet（subtitle设置为异常值）')
        .id('show_actionsheet_abnormal_subtitle_0050')
        .fontSize(16)
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          // subtitle设置为异常值123456@#&
          ActionSheet.show({
            title: '标题',
            subtitle: '123456@#&',
            message: '这是消息内容',
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
              }
            ],
            cancel: () => {
              console.log('取消操作')
            }
          })
        })

      Text('说明：此按钮点击时会调用ActionSheet.show()，subtitle设置为异常值123456@#&')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ top: 10 })
        .padding({ left: 20, right: 20 })

      Text('预期结果：编译时应该报错，因为subtitle应该是字符串类型')
        .fontSize(14)
        .fontColor(Color.Red)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })
        .padding({ left: 20, right: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(Color.White)
  }
}
