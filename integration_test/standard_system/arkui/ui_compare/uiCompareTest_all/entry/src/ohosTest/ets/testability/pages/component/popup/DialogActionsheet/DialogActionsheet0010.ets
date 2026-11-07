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
struct DialogActionsheet0010 {

  build() {
    Column() {
      Text('验证ActionSheet.show()中参数message的必填性')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('显示ActionSheet（不配置message）')
        .id('show_actionsheet_no_message_0010')
        .fontSize(16)
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          // 故意不配置message参数，验证必填性
          // ActionSheet.show({
          //   title: '标题',
          //   subtitle: '副标题',
          //   sheets: [
          //     {
          //       title: '选项1',
          //       action: () => {
          //         console.log('选择了选项1')
          //       }
          //     },
          //     {
          //       title: '选项2',
          //       action: () => {
          //         console.log('选择了选项2')
          //       }
          //     }
          //   ],
          //   cancel: () => {
          //     console.log('取消操作')
          //   }
          // })
        })

      Text('说明：此按钮点击时会调用ActionSheet.show()但不配置message参数')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ top: 10 })
        .padding({ left: 20, right: 20 })

      Text('预期结果：编译时应该报错，因为message是必填参数')
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


