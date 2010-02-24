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

class ProjectAdminGroupsController < BaseProjectsController
  before_filter :get_project
  before_filter :get_project_admin_group, :only => [:show, :destroy]

  allow :index, :show, :new, :create, :destroy, :exec => :user_is_administrator_for_project_and_company_employee?
  
  def index
    @project_admin_groups = @project.admin_groups

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @project_admin_groups }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project_admin_group }
    end
  end

  def new
    @project_admin_group = ProjectAdminGroup.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project_admin_group }
    end
  end

  def create
    @project_admin_group = ProjectAdminGroup.new(params[:project_admin_group])
    @project_admin_group.project = @project

    respond_to do |format|
      if @project_admin_group.save
        @project.deploy
        
        flash[:notice] = 'Project Admin Group was successfully added.'
        format.html { redirect_to(project_project_admin_group_path(:project_id => @project.id, :id => @project_admin_group.id)) }
        format.xml  { render :xml => @project_admin_group, :status => :created, :location => @project_admin_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project_admin_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_admin_group.destroy
    @project.deploy
    respond_to do |format|
      format.html { redirect_to(project_project_admin_groups_path(:project_id => @project.id)) }
      format.xml  { head :ok }
    end
  end

  private

  def get_project_admin_group
    @project_admin_group = @project.admin_groups.find(params[:id])
  end    
end
