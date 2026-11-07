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
struct RouterPage20 {
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
      Text('Router Clear 测试页面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.routerStackInfo)
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .backgroundColor('#f5f5f5')
        .padding(10)
        .borderRadius(8)
        .margin({ bottom: 20 })

      Button('清空路由栈 (router.clear)')
        .onClick(() => {
          try {
            // 获取清空前的路由栈信息
            const beforeLength = router.getLength();
            console.info(`准备清空路由栈，当前深度: ${beforeLength}`);
            
            // 执行清空操作
            router.clear();
            console.info('router.clear() 执行成功，路由栈已清空');
            
            // 更新显示信息
            setTimeout(() => {
              this.updateRouterStackInfo();
            }, 100);
          } catch (err) {
            console.error(`router.clear() 执行失败，错误码：${err.code}, 原因：${err.message}`);
          }
        })
        .id('btn')
        .width('80%')
        .backgroundColor('#ff6b6b')
        .fontColor('#ffffff')

      Button('刷新路由栈信息')
        .onClick(() => {
          this.updateRouterStackInfo();
        })
        .width('80%')
        .backgroundColor('#4ecdc4')
        .fontColor('#ffffff')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}