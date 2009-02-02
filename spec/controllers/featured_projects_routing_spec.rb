require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FeaturedProjectsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "featured_projects", :action => "index").should == "/featured_projects"
    end
  
    it "should map #new" do
      route_for(:controller => "featured_projects", :action => "new").should == "/featured_projects/new"
    end
  
    it "should map #show" do
      route_for(:controller => "featured_projects", :action => "show", :id => 1).should == "/featured_projects/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "featured_projects", :action => "edit", :id => 1).should == "/featured_projects/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "featured_projects", :action => "update", :id => 1).should == "/featured_projects/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "featured_projects", :action => "destroy", :id => 1).should == "/featured_projects/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/featured_projects").should == {:controller => "featured_projects", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/featured_projects/new").should == {:controller => "featured_projects", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/featured_projects").should == {:controller => "featured_projects", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/featured_projects/1").should == {:controller => "featured_projects", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/featured_projects/1/edit").should == {:controller => "featured_projects", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/featured_projects/1").should == {:controller => "featured_projects", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/featured_projects/1").should == {:controller => "featured_projects", :action => "destroy", :id => "1"}
    end
  end
end
