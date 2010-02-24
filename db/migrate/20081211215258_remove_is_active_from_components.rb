# ===========================================================================
# Copyright (C) 2009, Progress Software Corporation and/or its 
# subsidiaries or affiliates.  All rights reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ===========================================================================
class RemoveIsActiveFromComponents < ActiveRecord::Migration
  def self.up
    remove_column :issue_trackers, :is_active
    remove_column :repositories, :is_active
    remove_column :wikis, :is_active
  end

  def self.down
    add_column :issue_trackers, :is_active, :boolean
    add_column :repositories, :is_active, :boolean
    add_column :wikis, :is_active, :boolean
  end
end
