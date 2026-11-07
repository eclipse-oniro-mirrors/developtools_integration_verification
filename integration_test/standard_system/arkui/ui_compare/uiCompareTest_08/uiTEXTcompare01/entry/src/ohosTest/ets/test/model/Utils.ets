/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {Driver , ON, Component, On} from '@kit.TestKit'

export default class Utils {

  static  async  sleep(time : number) :Promise<void> {
    const result:string = await new Promise((resolve:Function)=>{
      setTimeout(()=> {
        resolve('sleep ok')
      },time)
    });
    console.info(result);
  }
  static  async waitAsync (ms:number):Promise<void>{
    return new Promise<void>((resolve)=>{
      setTimeout(resolve,ms)
    })

  }

  static  async clickComponentByKey (componentKey :string){
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(componentKey))
    if (component) {
      await component.click();
    } else {
      console.info('Component not found for key: ' + componentKey);
    }
  }

  /*
   * 安全的点击组件方法，包含null检查
   * @param driver UI测试驱动
   * @param selector 组件选择器
   * @param timeout 等待超时时间（毫秒）
   * @param description 组件描述（用于日志）
   * @returns 是否成功点击
   */
  static async safeClickComponent(driver: Driver, selector: On, timeout: number = 1000, description: string = 'component'): Promise<boolean> {
    try {
      let component: Component = await driver.waitForComponent(selector, timeout);
      if (component) {
        await component.click();
        console.info(`Successfully clicked ${description}`);
        return true;
      } else {
        console.info(`${description} component is null, skipping click`);
        return false;
      }
    } catch (e) {
      console.info(`Failed to find or click ${description}: ${e}`);
      return false;
    }
  }

  /*
   * 安全的等待组件方法，包含null检查和重试机制
   * @param driver UI测试驱动
   * @param selector 组件选择器
   * @param timeout 等待超时时间（毫秒）
   * @param retries 重试次数
   * @param description 组件描述（用于日志）
   * @returns Component对象或null
   */
  static async safeWaitForComponent(driver: Driver, selector: On, timeout: number = 1000, retries: number = 3, description: string = 'component'): Promise<Component | null> {
    for (let i = 0; i < retries; i++) {
      try {
        let component: Component = await driver.waitForComponent(selector, timeout);
        if (component) {
          console.info(`Successfully found ${description} on attempt ${i + 1}`);
          return component;
        }
      } catch (e) {
        console.info(`Attempt ${i + 1} failed to find ${description}: ${e}`);
        if (i < retries - 1) {
          await Utils.sleep(500); // 等待500ms后重试
        }
      }
    }
    console.info(`Failed to find ${description} after ${retries} attempts`);
    return null;
  }


}




