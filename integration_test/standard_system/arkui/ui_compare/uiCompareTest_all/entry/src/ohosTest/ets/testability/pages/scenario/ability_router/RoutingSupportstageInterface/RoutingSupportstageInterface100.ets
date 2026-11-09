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
import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';

class InnerParams {
  data3:number[]

  constructor(tuple:number[]) {
    this.data3 = tuple
  }
}

class RouterParams {
  data1:string
  data2:InnerParams

  constructor(str:string, tuple:number[]) {
    this.data1 = str
    this.data2 = new InnerParams(tuple)
  }
}

@Entry
@Component
struct RouterPage100 {
  @State routeStatus: string = '准备进行命名路由跳转';
  @State routerStackInfo: string = '';

  aboutToAppear() {
    this.updateRouterStackInfo();
  }

  // 获取当前路由栈信息
  updateRouterStackInfo() {
    try {
      const length = router.getLength();
      const state = router.getState();
      this.routerStackInfo = `路由栈深度: ${length}\n当前页面: ${state.name || '未知'}\n当前路径: ${state.path || '未知'}`;
    } catch (err) {
      this.routerStackInfo = '获取路由信息失败';
    }
  }

  build() {
    Column() {
      Text('命名路由接口测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.routerStackInfo)
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .backgroundColor('#f0f0f0')
        .padding(10)
        .borderRadius(8)
        .margin({ bottom: 20 })
        .width('90%')

      Text(this.routeStatus)
        .fontSize(16)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      Button('命名路由跳转 (pushUrl)')
        .onClick(() => {
          this.routeStatus = '正在执行命名路由跳转...';
          
          try {
            // 使用命名路由进行跳转，带参数
            router.pushUrl({
              url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface100_target',
              params: { 
                fromPage: 'RoutingSupportstageInterface100',
                testId: 100,
                timestamp: Date.now(),
                message: '来自命名路由的跳转参数'
              }
            }, router.RouterMode.Standard, (err) => {
              if (err) {
                console.error(`命名路由跳转失败，错误码：${err.code}, 原因：${err.message}`);
                this.routeStatus = `跳转失败: ${err.message}`;
              } else {
                console.info('命名路由跳转成功');
                this.routeStatus = '跳转成功';
              }
            });
          } catch (err) {
            console.error('命名路由跳转异常:', JSON.stringify(err));
            this.routeStatus = '跳转异常';
          }
        })
        .id('btn')
        .width('80%')
        .backgroundColor('#007dff')
        .fontColor('#ffffff')

      Button('使用Promise方式跳转')
        .onClick(() => {
          this.routeStatus = '正在使用Promise方式跳转...';
          
          // 使用Promise方式进行命名路由跳转
          router.pushUrl({
            url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface100_target',
            params: {
              fromPage: 'RoutingSupportstageInterface100',
              testId: 100,
              jumpType: 'Promise',
              timestamp: Date.now()
            }
          }).then(() => {
            console.info('Promise方式命名路由跳转成功');
            this.routeStatus = 'Promise跳转成功';
          }).catch((err: BusinessError) => {
            console.error(`Promise方式跳转失败，错误码：${err.code}, 原因：${err.message}`);
            this.routeStatus = `Promise跳转失败: ${err.message}`;
          });
        })
        .width('80%')
        .backgroundColor('#4ecdc4')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Button('替换当前页面 (replaceUrl)')
        .onClick(() => {
          this.routeStatus = '正在替换当前页面...';
          
          try {
            router.replaceUrl({
              url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface100_target',
              params: {
                fromPage: 'RoutingSupportstageInterface100',
                testId: 100,
                jumpType: 'replace',
                message: '这是替换跳转'
              }
            }).then(() => {
              console.info('replaceUrl命名路由跳转成功');
            }).catch((err: BusinessError) => {
              console.error(`replaceUrl跳转失败，错误码：${err.code}, 原因：${err.message}`);
              this.routeStatus = `替换跳转失败: ${err.message}`;
            });
          } catch (err) {
            console.error('replaceUrl跳转异常:', JSON.stringify(err));
            this.routeStatus = '替换跳转异常';
          }
        })
        .width('80%')
        .backgroundColor('#ff9800')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Button('刷新路由信息')
        .onClick(() => {
          this.updateRouterStackInfo();
        })
        .width('80%')
        .backgroundColor('#9e9e9e')
        .fontColor('#ffffff')
        .margin({ top: 20 })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}
