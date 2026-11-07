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
struct PreviewBasic0120 {
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false
  @State isActiveLocation: boolean = false
  @State isActiveHotspot: boolean = false

  build() {
    Navigation() {
      // NavRouter 1 - WLAN (PUSH模式,重新创建)
      NavRouter() {
        Row() {
          Row()
            .width('4.86%')
            .height('2.87%')
            .borderRadius(35)
            .margin({ left: 5, right: 12 })
            .backgroundColor('#FF6B9D') // 修改颜色为粉红色
          Text(`WLAN设置`)
            .fontSize(20) // 修改字体大小
            .fontWeight(600) // 修改字体粗细
            .fontColor(Color.Black) // 添加字体颜色
            .textAlign(TextAlign.Start)
        }
        .width('95%') // 修改宽度
        .height(70) // 修改高度
        .padding({ left: 10, right: 10 }) // 添加内边距

        NavDestination() {
          Column() {
            Text('WLAN列表').fontSize(24).margin({ top: 20, bottom: 20 })
            List() {
              ListItem() {
                Text('TP-LINK-5G').fontSize(18).padding(15)
              }.backgroundColor(Color.White).margin({ bottom: 5 })
              ListItem() {
                Text('ChinaNet-2.4G').fontSize(18).padding(15)
              }.backgroundColor(Color.White).margin({ bottom: 5 })
              ListItem() {
                Text('Mi-Router').fontSize(18).padding(15)
              }.backgroundColor(Color.White)
            }.width('100%').padding(10)
          }
        }
        .title('WLAN详细设置') // 修改标题文字
        .backgroundColor('#F5F5F5') // 添加背景色
      }
      .margin({ top: 15, bottom: 8, left: 10, right: 10 }) // 修改外边距
      .backgroundColor(this.isActiveWLAN ? '#E0E0E0' : '#FFFFFF') // 修改激活和非激活颜色
      .borderRadius(15) // 修改圆角
      .mode(NavRouteMode.PUSH_WITH_RECREATE) // 保持 PUSH_WITH_RECREATE 模式
      .onStateChange((isActivated: boolean) => {
        this.isActiveWLAN = isActivated
        console.info(`WLAN 状态改变: ${isActivated}`)
      })

      // NavRouter 2 - 蓝牙 (REPLACE模式)
      NavRouter() {
        Row() {
          Row()
            .width('4.86%')
            .height('2.87%')
            .borderRadius(35)
            .margin({ left: 5, right: 12 })
            .backgroundColor('#4FC3F7') // 修改颜色为蓝色
          Text(`蓝牙连接`)
            .fontSize(20)
            .fontWeight(600)
            .fontColor('#333333')
            .textAlign(TextAlign.Start)
        }
        .width('95%')
        .height('5.74%')
        .padding({ left: 10, right: 10 })

        NavDestination() {
          Column() {
            Text('蓝牙设备').fontSize(24).margin({ top: 20, bottom: 20 })
            List() {
              ListItem() {
                Text('AirPods Pro').fontSize(18).padding(15)
              }.backgroundColor(Color.White).margin({ bottom: 5 })
              ListItem() {
                Text('小米手环').fontSize(18).padding(15)
              }.backgroundColor(Color.White).margin({ bottom: 5 })
              ListItem() {
                Text('蓝牙耳机').fontSize(18).padding(15)
              }.backgroundColor(Color.White)
            }.width('100%').padding(10)
          }
        }
        .title('蓝牙设备管理')
        .backgroundColor('#F5F5F5')
      }
      .margin({ top: 8, bottom: 8, left: 10, right: 10 })
      .backgroundColor(this.isActiveBluetooth ? '#E0E0E0' : '#FFFFFF')
      .borderRadius(15)
      .mode(NavRouteMode.REPLACE) // REPLACE 模式 - 替换当前页面
      .onStateChange((isActivated: boolean) => {
        this.isActiveBluetooth = isActivated
        console.info(`蓝牙 状态改变: ${isActivated}`)
      })

      // NavRouter 3 - 位置服务 (PUSH模式)
      NavRouter() {
        Row() {
          Row()
            .width('4.86%')
            .height('2.87%')
            .borderRadius(35)
            .margin({ left: 5, right: 12 })
            .backgroundColor('#66BB6A') // 绿色
          Text(`位置服务`)
            .fontSize(20)
            .fontWeight(600)
            .fontColor('#333333')
            .textAlign(TextAlign.Start)
        }
        .width('95%')
        .height('5.74%')
        .padding({ left: 10, right: 10 })

        NavDestination() {
          Column() {
            Text('位置权限管理').fontSize(24).margin({ top: 20, bottom: 20 })
            Text('当前位置: 北京市海淀区').fontSize(18).margin({ bottom: 10 })
            Text('GPS精度: 高').fontSize(16).fontColor(Color.Gray)
          }.alignItems(HorizontalAlign.Start).padding(20)
        }
        .title('位置服务')
        .backgroundColor('#F5F5F5')
      }
      .margin({ top: 8, bottom: 8, left: 10, right: 10 })
      .backgroundColor(this.isActiveLocation ? '#E0E0E0' : '#FFFFFF')
      .borderRadius(15)
      .mode(NavRouteMode.PUSH) // PUSH 模式 - 普通压栈
      .onStateChange((isActivated: boolean) => {
        this.isActiveLocation = isActivated
        console.info(`位置服务 状态改变: ${isActivated}`)
      })

      // NavRouter 4 - 热点 (STANDARD模式)
      NavRouter() {
        Row() {
          Row()
            .width('4.86%')
            .height('2.87%')
            .borderRadius(35)
            .margin({ left: 5, right: 12 })
            .backgroundColor('#FFA726') // 橙色
          Text(`个人热点`)
            .fontSize(20)
            .fontWeight(600)
            .fontColor('#333333')
            .textAlign(TextAlign.Start)
        }
        .width('95%')
        .height('5.74%')
        .padding({ left: 10, right: 10 })

        NavDestination() {
          Column() {
            Text('个人热点设置').fontSize(24).margin({ top: 20, bottom: 20 })
            Text('热点名称: MyPhone_AP').fontSize(18).margin({ bottom: 10 })
            Text('密码: ********').fontSize(18).margin({ bottom: 10 })
            Button('开启热点').width('80%').height(50)
          }.alignItems(HorizontalAlign.Center).padding(20)
        }
        .title('个人热点')
        .backgroundColor('#F5F5F5')
      }
      .margin({ top: 8, bottom: 15, left: 10, right: 10 })
      .backgroundColor(this.isActiveHotspot ? '#E0E0E0' : '#FFFFFF')
      .borderRadius(15)
      .mode(NavRouteMode.PUSH) // PUSH 模式 - 压栈模式
      .onStateChange((isActivated: boolean) => {
        this.isActiveHotspot = isActivated
        console.info(`个人热点 状态改变: ${isActivated}`)
      })
    }
    .height('100%')
    .width('100%')
    .title('网络设置中心') // 修改导航标题
    .backgroundColor('#E8EAF6') // 修改背景颜色
    .titleMode(NavigationTitleMode.Mini) // 修改为 Mini 标题模式
    .mode(NavigationMode.Stack) // 修改为 Stack 模式
    .hideBackButton(false) // 显示返回按钮
  }
}
