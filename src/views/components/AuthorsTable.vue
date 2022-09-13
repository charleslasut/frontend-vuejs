<template>
  <div class="card">
    <div class="card-header pb-0">
      <h6>Authors table</h6>
    </div>
    <div class="card-body px-0 pt-0 pb-2">
      <div class="table-responsive p-0">
        <table class="table align-items-center mb-0">
          <thead>
            <tr>
              <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Author</th>
              <th
                class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
              >Function</th>
              <th
                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
              >Country</th>
              <th
                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
              >Status</th>
              <th class="text-secondary opacity-7"> 
                Action 
              </th>
            </tr>
          </thead>
          <tbody v-if="users && users.length">
          <tr v-for="post of users">
              <td>
                <div class="d-flex px-2 py-1">
                  <div>
                    <img :src=post.avatar 
                      class="avatar avatar-sm me-3"
                      :alt=post.avatar 
                    />
                  </div>
                  <div class="d-flex flex-column justify-content-center">
                    <h6 class="mb-0 text-sm">{{ post.name }}</h6>
                    <p class="text-xs text-secondary mb-0">{{ post.email }}</p>
                  </div>
                </div>
              </td>
              <td>
                <p class="text-xs font-weight-bold mb-0">{{ post.function }}</p>
                <p class="text-xs text-secondary mb-0">Organization</p>
              </td>
              <td class="align-middle text-center">
                <span class="text-secondary text-xs font-weight-bold">{{ post.country }}</span>
              </td>
              <td class="align-middle text-center text-sm">
                <span class="badge badge-sm bg-gradient-success">Online</span>
              </td>
              <td class="align-middle">
                <button @click="editUser()" class="btn btn-success" style="margin-right: 10px;">Edit</button>
                <button @click="deleteData(post.id) in result" class="btn btn-danger">
                  Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: "authors-table",
  data() {
    return  {
      users: [],
      errors: []
    }
  },

  created() {
    axios.get('https://631b0421dc236c0b1eea1e33.mockapi.io/users/')
      .then(response => {
        this.users = response.data
      })
      .catch(error => {
        this.errors.push(error)
      })
  },


  methods: {
    async deleteData(id) {
      let x = window.confirm("You want to delete the userID " + id + " ?");

      if (x) {
        const user = await axios.delete(
          "https://631b0421dc236c0b1eea1e33.mockapi.io/users/" + id
        );

        console.log(user);
        alert("User deleted!");
      }
    }
  },
};
</script>
