<nav class="navbar navbar-default navbar-static-top navbar-fixed-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="dashboard.php">SDA Builder</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
              
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       <!-- <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                       <!-- </li>-->
					   <?php if($_SESSION['user_type']=="admin"){ ?>
                        <li><a href="admin.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
						<?php }else if($_SESSION['user_type']=="Store"){ ?>
						<li><a href="store.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
						<?php }else if($_SESSION['user_type']=="Staff"){ ?>
						<li><a href="staff.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
						<?php }else if($_SESSION['user_type']=="Supervisor"){ ?>
						<li><a href="supervisor.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
						<?php } ?>
					  <!--  <?php if(($_SESSION['user_type']=="admin") || ($_SESSION['user_type']=="Staff")) { ?>
                            <li><a href="equipment.php"><i class="fa fa-gears"></i> Equipments<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href="equipment.php">Equipments</a>
                                </li>
                                <li>
                                    <a href="add-equipment.php">Add Equipments</a>
                                </li>
								
								        <li><a href="pending.php"><i class="fa fa-exchange"></i> <span>Pending </span></a></li>
        <li><a href="transfer.php"><i class="fa fa-exchange"></i> <span>Transfer</span></a></li>
                            </ul>
			</li>
							
	                    <?php } ?>-->
                      <?php if(($_SESSION['user_type']=="admin") || ($_SESSION['user_type']=="Staff")) { ?>
        <li><a href="project.php"><i class="fa fa-paypal"></i> Project<span class="fa arrow"></span></a>
			<ul class="nav nav-second-level">
                                <li>
                                    <a href="project.php">Project</a>
                                </li>
                                <li>
                                    <a href="add-project.php">Add Project</a>
                                </li>
                                <li>
                                    <a href="category.php">Category </a>
                                </li>
								</ul>
							</li>
	  <?php } ?>
	  <?php if($_SESSION['user_type']=="Supervisor") { ?>
        <li><a href="project.php"><i class="fa fa-paypal"></i> <span>Project</span></a></li>
	  <?php } ?>
	 <!--  <?php if($_SESSION['user_type']=="admin") { ?>
        <li><a href="assign-project.php"><i class="fa fa-paypal"></i> Assign Projects<span class="fa arrow"></span></a>
			<ul class="nav nav-second-level">
                                <li>
                                    <a href="assign.php">Assign</a>
                                </li>
                                <li>
                                    <a href="assign-project.php">Add Assign Project</a>
                                </li>
                            </ul>
							</li>
	  <?php } ?>




                        <?php if($_SESSION['user_type']=="admin"){ ?>

<?php if(($_SESSION['user_type']=="admin") || ($_SESSION['user_type']=="Staff")) { ?>
                            <li><a href="equipment.php"><i class="fa fa-gears"></i> Payment<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
                                <li>
                                    <a href="income.php">Income</a>
                                </li>
                                <li>
                                    <a href="expense.php">Expense</a>
                                </li>
                            </ul>
			</li>
							
	                    <?php } ?>-->
	 <li>
                            <a href="users.php"><i class="fa fa-files-o fa-fw"></i>Staffs<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="users.php">Staffs</a>
                                </li>
								<li>
                                    <a href="attendance.php">Attendance</a>
                                </li>
                                <li>
                                    <a href="add-users.php">Add Staffs</a>
                                </li>
                                <li>
                                    <a href="salarys.php">Salary</a>
                                </li>
                            </ul></li>
                       <?php }else if($_SESSION['user_type']=="Store"){ ?> 
              <li><a href="store-tr.php"><i class="fa fa-exchange"></i> <span>TR</span></a></li>

         <li><a href="store-equipment.php"><i class="fa fa-exchange"></i> <span>Equipment</span></a></li>
        <li><a href="store-pending.php"><i class="fa fa-exchange"></i> <span>Pending </span></a></li>
        <li><a href="store-transfer.php"><i class="fa fa-exchange"></i> <span>Transfer</span></a></li>
		<?php }else if($_SESSION['user_type']=="Staff"){ ?>
        <li><a href="staff-approval.php"><i class="fa fa-exchange"></i> <span>Approval </span></a></li>
        <li><a href="staff-pending.php"><i class="fa fa-exchange"></i> <span>Pending</span></a></li>
		<?php }else if($_SESSION['user_type']=="Supervisor"){ ?>
        <li><a href="supervisor-pending.php"><i class="fa fa-exchange"></i> <span>Pending </span></a></li>
        <li><a href="supervisor-transfer.php"><i class="fa fa-exchange"></i> <span>Transfering</span></a></li>
<li><a href="transfer-status.php"><i class="fa fa-exchange"></i> <span>Transfer Status</span></a></li>                               <?php } ?>
 <li><a href="assign-project.php"><i class="fa fa-user"></i> <?php echo $_SESSION['full_name']; ?><span class="fa arrow"></span></a>
			<ul class="nav nav-second-level">
                                <li>
                                    <a href="my-profile.php">My Profile</a>
                                </li>
                                <li>
                                    <a href="logout.php">Logout</a>
                                </li>
                            </ul>
							</li>
                <li ><a  href="https://hangouts.google.com/call/l7nqtc4gefoeci7sn7dajdojtma?hl=en-GB&no_rd" target="_blank"><i class="fa fa-laptop"></i>Screen Share</a>

        
                            <!-- 
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		<br><br>